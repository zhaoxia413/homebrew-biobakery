class Graphlan < Formula
  desc "Graphlan"
  homepage "http://huttenhower.sph.harvard.edu/graphlan"
  url "https://bitbucket.org/nsegata/graphlan/downloads/graphlan_commit_d2ec14e.zip"
  version "0.9.7"
  sha256 "e00a9dc45c7b3055a52e5708eb5a114af88971e5ec2a814a9bd723e44971f4ac"

  # add the option to build without python
  option "without-python", "Build without python2 support"
  depends_on :python => :recommended if MacOS.version <= :snow_leopard

  # matplotlib on some platforms requires homebrew freetype
  depends_on "freetype" => :recommended

  resource "numpy" do
    url "https://pypi.python.org/packages/source/n/numpy/numpy-1.11.0.tar.gz"
    sha256 "a1d1268d200816bfb9727a7a27b78d8e37ecec2e4d5ebd33eb64e2789e0db43e"
  end

  resource "matplotlib" do
    url "https://pypi.python.org/packages/source/m/matplotlib/matplotlib-1.5.1.tar.gz"
    sha256 "3ab8d968eac602145642d0db63dd8d67c85e9a5444ce0e2ecb2a8fedc7224d40"
  end

  resource "biopython" do
    url "http://biopython.org/DIST/biopython-1.66.tar.gz"
    sha256 "5178ea3b343b1d8710f39205386093e5369ed653aa020e1b0c4b7622a59346c1"
  end

  resource "pandas" do
    url "https://pypi.python.org/packages/source/p/pandas/pandas-0.13.1.tar.gz"
    sha256 "6813746caa796550969ed98069f16627f070f6d8d60686cfb3fa0e66c2e0312b"
  end

  resource "biom" do
    url "https://pypi.python.org/packages/source/b/biom-format/biom-format-2.0.1.tar.gz"
    sha256 "e2e8a843e7a85b6f48381e8b24b2e0809b111507efe7e1b86e8a63cb1b60a97c"
  end

  resource "pyparsing" do
    url "https://pypi.python.org/packages/94/51/3dd26b41be55ed05e72d1da87e4a732d8b92245b1f2f7fe2fa65a4910858/pyparsing-2.1.1.tar.gz"
    sha256 "9bae5cd4cbee6da0d7d8d9a1647f5253a3b89652e707647eaf1961f4932ae6c6"
  end

  resource "cycler" do
    url "https://pypi.python.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "dateutil" do
    url "https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902/python-dateutil-2.5.3.tar.gz"
    sha256 "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
  end

  def install
    # add the install location of the libraries to the PYTHONPATH
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib64/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend "PYTHONPATH", libexec, ':'
    ENV.prepend "PYTHONPATH", libexec/"export2graphlan", ':'

    # update LDFLAGS for numpy install
    ENV.append "LDFLAGS", "-shared" if OS.linux?    
    # install dependencies
    for python_package in ["numpy","matplotlib","biopython", "pandas", "biom", "pyparsing", "cycler", "dateutil"]
        resource(python_package).stage do
            system "python", *Language::Python.setup_install_args(libexec)
        end
    end

    # copy the source to the library install location
    libexec.install Dir["*"]

    # copy the executable scripts to the bin folder
    bin.install libexec/"graphlan.py"
    bin.install libexec/"graphlan_annotate.py"
    bin.install libexec/"export2graphlan/export2graphlan.py"

    # create stubs of the scripts with the pythonpath added
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/graphlan.py", "--help"
  end
end

