GFF = HT.Gene.gff3
ZIP = HT.KYGene.gff3.zip
URL = http://ghost.zool.kyoto-u.ac.jp/datas/$(ZIP)

data-raw/$(GFF): data-raw $(GFF)
	mv $(GFF) data-raw

$(GFF): $(ZIP)
	unzip -o $(ZIP)

$(ZIP): 
	wget -U firefox $(URL)

data-raw:
	mkdir -p data-raw

clean:
	rm -f $(ZIP)

