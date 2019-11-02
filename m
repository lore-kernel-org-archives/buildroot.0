From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 19:00:49 +0100
Subject: [Buildroot] [PATCH 0/3] Support for D: check and doc
Message-ID: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This series adds some missing checks and documentation for the support of the
D programming language.

Eric Le Bihan (3):
  package/gcc: install wrapper for GDC
  toolchain/toolchain-external: add a check for D language support
  docs/manual: document D language support

 docs/manual/adding-packages-directory.txt      |  4 ++++
 package/gcc/gcc.mk                             |  2 +-
 toolchain/helpers.mk                           | 18 ++++++++++++++++++
 .../pkg-toolchain-external.mk                  |  6 +++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

--
2.21.0
