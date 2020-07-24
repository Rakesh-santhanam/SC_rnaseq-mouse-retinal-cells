## downloaded data for dropseq barcode tag based method from maccaroll lab
## famous 2015 cell paper https://www.cell.com/fulltext/S0092-8674(15)00549-8
## in this papaer they have data for lot of experimetents such as mix of mouse and human and mouse p14 retina 
## super series
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63473

## here I am interested in only P14 mosuse retina 1  - GSM1626793
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63472

## so downloaded manually 
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-5/SRR1853178/SRR1853178.1

## for preprocessing sra files zumis recommend to use --origfmt --defline-qual '+' see reprocessing of public data in wiki zumis
fastq-dump --origfmt --gzip --defline-qual '+' --split-files SRR1853178.1 


zcat SRR1853178.1_1.fastq.gz | wc -l
2040842864
zcat SRR1853178.1_2.fastq.gz | wc -l
2040842864
## both files have same line so it is good

## star index build based on GRCm38.p6.genome.fa files using star version 2_7_3a 

## running zumi is not easy
## mapping.r files gas some issues with , genome size
## maually edited mapping.r files
## in yaml files ram limit has to be greater than genome file might be greater than 30 for mouse and lot for human
bash ../zumi_scrb_method/zUMIs/zUMIs.sh -c -y srr1853178.yaml
 
