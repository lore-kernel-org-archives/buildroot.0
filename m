From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 13:27:11 +0200
Subject: [Buildroot] [PATCH 0 of 3] linux/uboot: add support for custom
 Mercurial repositories
Message-ID: <patchbomb.1374233231@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/uboot/Config.in |  20 ++++++++++++++------
 boot/uboot/uboot.mk  |   5 ++++-
 linux/Config.in      |  29 +++++++++++++++++++----------
 linux/linux.mk       |   5 ++++-
 4 files changed, 41 insertions(+), 18 deletions(-)
