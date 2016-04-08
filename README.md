# homebrew-biobakery
Biobakery formulae for the Homebrew package manager.

To get started, install [HomeBrew](http://brew.sh/) for MacOS or [LinuxBrew](http://linuxbrew.sh/) for Linux platforms. 

1. Tap the biobakery homebrew repository
    * `` $ brew tap biobakery/biobakery ``
2. Install the biobakery tools
    1. HUMAnN2
        * `` $ brew install humann2 ``
        * Demo databases are included with the install. To install the full databases, see the humann2 documentation: http://huttenhower.sph.harvard.edu/humann2
    2. KneadData
        * `` $ brew install kneaddata ``
        * Demo databases are included with the install. To install the full databases, see the kneaddata documentation: http://huttenhower.sph.harvard.edu/kneaddata
    3. Picrust
        * `` $ brew install picrust ``
    4. MaAsLin
        * `` $ brew install maaslin ``
    5. MetaPhlAn2
        * `` $ brew install metaphlan2 ``
        * The databases will be installed at $HOMEBREW/Cellar/metaphlan2/2.2.0/db_v20/ (with $HOMEBREW on Linux at $HOME/.linuxbrew/)
    6. ShortBRED
        * Install [USEARCH](http://www.drive5.com/usearch/)
        * `` $ brew install shortbred ``
        * To install without blast (which can cause errors with g++ 5x), add the option "--without-blast"
    7. SparseDOSSA
        * `` $ brew install sparsedossa ``
    8. PPANINI
        * `` $ brew install ppanini ``
    9. LEfSe
    10. PhyloPhlAn
    11. GraPhlAn
        * `` $ brew install graphlan ``
    12. CCREPE / BAnOCC
    13. MicroPITA
    14. BreadCrumbs
        * `` $ brew install breadcrumbs ``
    15. ARepA

# Next steps

Lauren: set up Github bioBakery, make sure there's a team / group etc. for users the same way as Bitbucket.
Randall: send comments / missing formulas from Lauren's current list.
  Revamp Bitbucket repository, don't need backwards compatibility, two targets: download+run, or Amazon AMI
