From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 09:22:57 +0200
Subject: [Buildroot] [PATCH 0 of 6 v2] linux/uboot: add support for custom
 Mercurial repositories
Message-ID: <patchbomb.1374650577@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2:
- update based on comments from Peter
- added a few new patches, loosely related to the series.

 Config.in.legacy     |  58 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 boot/uboot/Config.in |  29 ++++++++++++++++-------------
 boot/uboot/uboot.mk  |   5 ++++-
 linux/Config.in      |  31 +++++++++++++++++++------------
 linux/linux.mk       |   5 ++++-
 5 files changed, 96 insertions(+), 32 deletions(-)
