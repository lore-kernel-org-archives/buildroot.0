From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2011 10:46:38 +0200
Subject: [Buildroot] [pull request v4] Pull request for branch
	for-2011.11/asciidoc-manual
Message-ID: <cover.1318236261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the fourth version of this patch set. Since the previous
posting (September 29th):

 * Fixed crosstool-NG URL and crosstool-NG name (Crosstool-NG ->
   crosstool-NG)

 * Fixed several remaining HTML tags and undefined references inside
   the document. Things are still not completely great on that front
   (in the PDF rendering), but it's improving, and we'll for sure
   continue to improve things once it's merged.

 * Updated the Makefile bits thanks to additional input from Yann.

 * Added Yann and/or Luca Acked-by or Reviewed-by tags.

Regards,

Thomas

The following changes since commit ddb8c639c312fd9f65dbb123837c100281495d50:

  libplayer: mark python bindings as broken (2011-10-08 22:39:29 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/asciidoc-manual

Thomas Petazzoni (4):
      manual: convert existing documentation to the asciidoc format
      manual: provide make targets to build the documentation
      remove the old buildroot.html documentation
      remove Glibc_vs_uClibc document

 Makefile                                     |   45 +-
 docs/Glibc_vs_uClibc.html                    |  240 ----
 docs/buildroot.html                          | 1819 --------------------------
 docs/manual/adding-packages-autotargets.txt  |  171 +++
 docs/manual/adding-packages-cmaketargets.txt |  142 ++
 docs/manual/adding-packages-conclusion.txt   |   10 +
 docs/manual/adding-packages-directory.txt    |   75 ++
 docs/manual/adding-packages-gentargets.txt   |  307 +++++
 docs/manual/adding-packages-gettext.txt      |   44 +
 docs/manual/adding-packages-handwritten.txt  |  167 +++
 docs/manual/adding-packages.txt              |   21 +
 docs/manual/board-support.txt                |   35 +
 docs/manual/ccache-support.txt               |   21 +
 docs/manual/customize-busybox-config.txt     |   24 +
 docs/manual/customize-kernel-config.txt      |   12 +
 docs/manual/customize-rootfs.txt             |   36 +
 docs/manual/customize-uclibc-config.txt      |   32 +
 docs/manual/customize.txt                    |   10 +
 docs/manual/download-location.txt            |   26 +
 docs/manual/external-toolchain.txt           |   84 ++
 docs/manual/getting.txt                      |   23 +
 docs/manual/how-buildroot-works.txt          |   59 +
 docs/manual/introduction.txt                 |   69 +
 docs/manual/manual.txt                       |   32 +
 docs/manual/rebuilding-packages.txt          |   62 +
 docs/manual/using-buildroot-toolchain.txt    |   20 +
 docs/manual/using.txt                        |  183 +++
 27 files changed, 1709 insertions(+), 2060 deletions(-)
 delete mode 100644 docs/Glibc_vs_uClibc.html
 delete mode 100644 docs/buildroot.html
 create mode 100644 docs/manual/adding-packages-autotargets.txt
 create mode 100644 docs/manual/adding-packages-cmaketargets.txt
 create mode 100644 docs/manual/adding-packages-conclusion.txt
 create mode 100644 docs/manual/adding-packages-directory.txt
 create mode 100644 docs/manual/adding-packages-gentargets.txt
 create mode 100644 docs/manual/adding-packages-gettext.txt
 create mode 100644 docs/manual/adding-packages-handwritten.txt
 create mode 100644 docs/manual/adding-packages.txt
 create mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/ccache-support.txt
 create mode 100644 docs/manual/customize-busybox-config.txt
 create mode 100644 docs/manual/customize-kernel-config.txt
 create mode 100644 docs/manual/customize-rootfs.txt
 create mode 100644 docs/manual/customize-uclibc-config.txt
 create mode 100644 docs/manual/customize.txt
 create mode 100644 docs/manual/download-location.txt
 create mode 100644 docs/manual/external-toolchain.txt
 create mode 100644 docs/manual/getting.txt
 create mode 100644 docs/manual/how-buildroot-works.txt
 create mode 100644 docs/manual/introduction.txt
 create mode 100644 docs/manual/manual.txt
 create mode 100644 docs/manual/rebuilding-packages.txt
 create mode 100644 docs/manual/using-buildroot-toolchain.txt
 create mode 100644 docs/manual/using.txt

Thanks,
-- 
Thomas Petazzoni
