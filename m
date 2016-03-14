From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:43:53 +0100
Subject: [Buildroot] [git commit] taskd: include only one license file
Message-ID: <20160314224357.829DC807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b931ab7aafdb261086f0ff62dbdfff79914d14a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING and LICENSE are identical, so no point including them both.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taskd/taskd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
index 65713d2..34a260e 100644
--- a/package/taskd/taskd.mk
+++ b/package/taskd/taskd.mk
@@ -7,7 +7,7 @@
 TASKD_VERSION = 1.1.0
 TASKD_SITE = http://taskwarrior.org/download
 TASKD_LICENSE = MIT
-TASKD_LICENSE_FILES = COPYING LICENSE
+TASKD_LICENSE_FILES = COPYING
 TASKD_DEPENDENCIES = gnutls util-linux
 
 $(eval $(cmake-package))
