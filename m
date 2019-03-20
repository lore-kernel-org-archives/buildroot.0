From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Wed, 20 Mar 2019 14:47:51 +0100
Subject: [Buildroot] [PATCH v2 0/3] Gummiboot fixup
Message-ID: <20190320134754.14357-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

These patches fixes gummiboot for building with toolchains using
newer gcc and glibc versions.

Changes since v1:
 - Formatted patch with git format-patch and added SoB

Esben Haabendal (3):
  gummiboot: use new official upstream git repository
  gummiboot: upgrade to last commit before being removed
  gummiboot: fix compatibility with newer glibc versions

 ...w-building-with-newer-glibc-versions.patch | 31 +++++++++++++++++++
 boot/gummiboot/gummiboot.mk                   |  4 +--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 boot/gummiboot/0001-Allow-building-with-newer-glibc-versions.patch

-- 
2.21.0
