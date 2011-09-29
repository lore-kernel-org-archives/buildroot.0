From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 22:05:57 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/asciidoc-manual
Message-ID: <cover.1317326629.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The initial proposal and discussion for this took place early August
(initial RFC sent on August 4th), and a pull request has been sent on
August 31th, 10 hours after the release of 2011.08.

A lot of updates to the documentation are needed, but at this point,
contributors don't know if they should post patches on top of this
AsciiDoc documentation, or on top of the existing HTML documentation.

Would it be possible to make some progress on this ? The progress
might also be: this is too complicated, and keeping an HTML format is
in the end simpler.

Regards,

Thomas

The following changes since commit 30f416cc86c115c34984b0499b76a00c8482abeb:

  gst-plugins-bad: bump version (2011-09-29 21:02:14 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/asciidoc-manual

Thomas Petazzoni (4):
      manual: convert existing documentation to the asciidoc format
      manual: provide make targets to build the documentation
      remove the old buildroot.html documentation
      remove Glibc_vs_uClibc document

 Makefile                                     |   46 +-
 docs/Glibc_vs_uClibc.html                    |  240 ----
 docs/buildroot.html                          | 1819 --------------------------
 docs/manual/adding-packages-autotargets.txt  |  167 +++
 docs/manual/adding-packages-cmaketargets.txt |  140 ++
 docs/manual/adding-packages-conclusion.txt   |   10 +
 docs/manual/adding-packages-directory.txt    |   76 ++
 docs/manual/adding-packages-gentargets.txt   |  303 +++++
 docs/manual/adding-packages-gettext.txt      |   44 +
 docs/manual/adding-packages-handwritten.txt  |  165 +++
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
 27 files changed, 1699 insertions(+), 2060 deletions(-)
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
