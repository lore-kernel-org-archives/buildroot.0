From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Nov 2013 19:28:05 +0100
Subject: [Buildroot] [PATCH 3/4] package/tzdata: bump
In-Reply-To: <cover.1383675996.git.yann.morin.1998@free.fr>
References: <cover.1383675996.git.yann.morin.1998@free.fr>
Message-ID: <258a7819923f191248f432abec921347f029b00a.1383675996.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Pretty nothing to say about the bump, except it has the
usual timezone fixes and updates.
---
 package/tzdata/tzdata.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 26f623d..9109e2a 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2013c
+TZDATA_VERSION = 2013h
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-zic
-- 
1.8.1.2
