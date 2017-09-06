From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:30:57 +0200
Subject: [Buildroot] [git commit] wsapi: add LICENSE_FILES
Message-ID: <20170906203034.23BCA8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c6ac35997d9cc4be4eb3af7f1d084751a8e92a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wsapi/wsapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 0cca6cb..64a2757 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -6,5 +6,6 @@
 
 WSAPI_VERSION = 1.6.1-1
 WSAPI_LICENSE = MIT
+WSAPI_LICENSE_FILES = $(WSAPI_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
