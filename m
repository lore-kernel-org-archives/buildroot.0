From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Nov 2018 21:18:42 +0100
Subject: [Buildroot] [PATCH 1/1] dt-utils: fix hash
Message-ID: <20181113201842.30055-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hash has been reported as wrong by autobuilder since August 16th
Perhaps, it was wrong since bump to v2018.05.0 on August 9th

Fixes:
 - http://autobuild.buildroot.org/results/c6c8ede30623cc20011916cc95dbdae34dcc0344

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dt-utils/dt-utils.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 0d63b12353..5805adf361 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a3aae73da39fd46775de390b7babafb63767082da10870c01b6595c4c9762af6  dt-utils-v2018.05.0.tar.gz
+sha256 d0f53c76bc9f821a6506c8db3b623922d82570a017a9a40ad118bd7c957672b6  dt-utils-v2018.05.0.tar.gz
 sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
-- 
2.14.1
