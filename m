From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 13:58:29 +0200
Subject: [Buildroot] [PATCH 1 of 5] cifs-utils: correct license GPLv3 ->
	GPLv3+
In-Reply-To: <patchbomb.1381319908@argentina>
References: <patchbomb.1381319908@argentina>
Message-ID: <32bd9d0979ff201fc926.1381319909@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: some files are GPLv2+, others are GPLv3+. There are a few headers also
declared as LGPL. I think the right approach is to set GPLv3+ here.

 package/cifs-utils/cifs-utils.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -7,7 +7,7 @@
 CIFS_UTILS_VERSION = 6.1
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
-CIFS_UTILS_LICENSE = GPLv3
+CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
 define CIFS_UTILS_NO_WERROR
