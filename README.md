# homebrew-biobakery #
Biobakery formulae for the Homebrew package manager.

To get started, install [HomeBrew](http://brew.sh/) for MacOS or [LinuxBrew](http://linuxbrew.sh/) for Linux platforms. 

## Install the full biobakery tool suite plus biobakery demos ##

1. Install dependencies [Java Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html) and [USEARCH](http://www.drive5.com/usearch/)
2. Install the tool suite
    * `` $ brew tap biobakery/biobakery ``
    * `` $ brew install biobakery_tool_suite ``
3. Test the install
    * `` $ biobakery_demos --tool all --mode test ``

## Install individual biobakery tools ##

If you do not want to install the full tool suite, you can select individual tools to install. 

1. Tap the biobakery homebrew repository
    * `` $ brew tap biobakery/biobakery ``
2. Install the individual tools needed  
    1. HUMAnN2
        * `` $ brew install humann2 ``
        * Demo databases are included with the install. To install the full databases, see the humann2 documentation: http://huttenhower.sph.harvard.edu/humann2
    2. KneadData
        * Install [Java Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html)
        * `` $ brew install kneaddata ``
        * Demo databases are included with the install. To install the full databases, see the kneaddata documentation: http://huttenhower.sph.harvard.edu/kneaddata
    3. Picrust
        * `` $ brew install picrust ``
    4. MaAsLin
        * `` $ brew install maaslin ``
    5. MetaPhlAn2
        * `` $ brew install metaphlan2 ``
    6. ShortBRED
        * Install [USEARCH](http://www.drive5.com/usearch/)
        * `` $ brew install shortbred ``
        * To install without blast (which can cause errors with g++ 5x), add the option "--without-blast"
    7. SparseDOSSA
        * `` $ brew install sparsedossa ``
    8. PPANINI
        * Install [USEARCH](http://www.drive5.com/usearch/)
        * `` $ brew install ppanini ``
    9. LEfSe
        * `` $ brew install lefse ``
    10. GraPhlAn
        * `` $ brew install graphlan ``
    11. MicroPITA
        * `` $ brew install micropita ``
    12. BreadCrumbs
        * `` $ brew install breadcrumbs ``
    13. StrainPhlAn
        * Install [Samtools v1.19 and Bcftools (included)] (https://sourceforge.net/projects/samtools/files/samtools/0.1.19/)
        * `` $ brew install strainphlan ``
        * To install without blast (which can cause errors with g++ 5x), add the option "--without-blast"
3. Test the individual installs
    1. Install biobakery_demos
        * `` $ brew install biobakery_demos ``
    2. Test an individual tool install
        * `` $ biobakery_demos --tool humann2 --mode test ``
    3. You can also view the commands for each demo run
        * `` $ biobakery_demos --tool humann2 --mode view ``
    4. And you can run a demo and view the output files created
        * `` $ biobakery_demos --tool humann2 --mode run --output humann2_demo_output ``

