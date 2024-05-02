package main

import (
	"bytes"
	"context"
	"github.com/pdfcpu/pdfcpu/pkg/pdfcpu"
	"github.com/philippgille/chromem-go"
	"runtime"
	"testing"
)

func TestChrome(t *testing.T) {
	ctx := context.Background()
	db := chromem.NewDB()
	c, err := db.CreateCollection("knowledge-base", nil, nil)
	if err != nil {
		t.Error(err)
	}
	err = c.AddDocuments(ctx, []chromem.Document{
		{
			ID:      "1",
			Content: "The sky is blue because of Rayleigh scattering.",
		},
		{
			ID:      "2",
			Content: "Leaves are green because chlorophyll absorbs red and blue light.",
		},
	}, runtime.NumCPU())
	if err != nil {
		t.Error(err)
	}

	res, err := c.Query(ctx, "Why is the sky blue?", 1, nil, nil)
	if err != nil {
		t.Error(err)
	}

	t.Logf("ID: %v\nSimilarity: %v\nContent: %v\n", res[0].ID, res[0].Similarity, res[0].Content)
}

var embedPdfMinerHighLevel []byte

func TestPdf(t *testing.T) {
	reader := bytes.NewBuffer(nil)
	err := pdfcpu.WriteReader("GO e14d02f8e048415e9958e8d109b63bc0.pdf", reader)
	if err != nil {
		t.Error(err.Error())
		return
	}
	t.Logf("%s", reader.String())
}
