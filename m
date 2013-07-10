From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:04:51 +0200
Subject: [Buildroot] [git commit] json-c: define license
Message-ID: <20130710202005.84D209A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b7e6fdbc706b946b32fb91e146344e1c10f5483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/json-c/json-c.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 031b541..0a2f70e 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,5 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases/
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPT = --disable-oldname-compat
+JSON_C_LICENSE = MIT
+JSON_C_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
