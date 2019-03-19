From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:28:49 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
Message-ID: <20190319112852.9592-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

These patches fixes gummiboot for building with toolchains using
newer gcc and glibc versions.

Esben Haabendal (3):
  gummiboot: use new official upstream git repository
  gummiboot: upgrade to last commit before being removed
  gummiboot: fix compatibility with newer glibc versions

 boot/gummiboot/0001-glibc-2.25-fix.patch | 16 ++++++++++++++++
 boot/gummiboot/gummiboot.mk              |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 boot/gummiboot/0001-glibc-2.25-fix.patch

-- 
2.21.0
