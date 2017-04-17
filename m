From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 14:33:01 +0200
Subject: [Buildroot] [git commit] sam-ba: use SPDX short identifier for
	license string
Message-ID: <20170417123448.960EB7FD79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e70af258412347a29a2ef864c7e8df38942cc0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sam-ba/sam-ba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 7fc65c0..43e061b 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -8,7 +8,7 @@ SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.16
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
 SAM_BA_LICENSE = SAM-BA license (sam-ba executable), \
-		BSD-2c like, BSD-4c (TCL and applets code)
+		BSD-2-Clause like, BSD-4-Clause (TCL and applets code)
 SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
 		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
 
