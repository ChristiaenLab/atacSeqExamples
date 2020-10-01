GFF = HT.Gene.gff
ZIP = HT.KYGene.gff3.zip
URL = http://ghost.zool.kyoto-u.ac.jp/datas/$(ZIP)

data-raw/$(GFF): data-raw
	wget -U firefox $(URL)
	unzip -o $(ZIP)
	mv $(GFF) data-raw

data-raw:
	mkdir -p data-raw

clean:
	rm -f $(ZIP)

