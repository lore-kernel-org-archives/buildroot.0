From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 13:52:29 +0100
Subject: [Buildroot] [git commit] mongodb: fix legal info build error
Message-ID: <20160104125826.C490681F92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af3cf592c62065c34563d1bf3934c82def3a317
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove extra comma to fix legal info build error.

Fixes:
http://autobuild.buildroot.net/results/87faca89bc9ff6ff4699c4b50bbb890ff80b95ee/
http://autobuild.buildroot.net/results/ea54721ef0d1c210b2baa9eef7c6c68863020b50/
http://autobuild.buildroot.net/results/5a81db472d432880f44dfb30bae0d777b6ae6c79/
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 1eed897..1027c83 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -9,7 +9,7 @@ MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
 MONGODB_LICENSE = AGPLv3, Apache-2.0
-MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt, APACHE-2.0.txt
+MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
 
 MONGODB_DEPENDENCIES = host-scons
 
