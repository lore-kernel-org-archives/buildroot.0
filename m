From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Nov 2020 21:52:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix license
Message-ID: <20201110205242.844897-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix license file name in hash file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 4f60b22b05..1de2399e03 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256  8dc1180031018756ccd5acf6c26c4175bcac79e512e8a2ea8569fdf5d3f9bd6c  s390-tools-2.15.1.tar.gz
-sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  COPYING
+sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
-- 
2.28.0
