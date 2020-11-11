From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 09:08:34 +0100
Subject: [Buildroot] [git commit] package/s390-tools: fix license
Message-ID: <20201111075647.420F67FADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50e4434fc307a209c91a7941a44a3a026263275a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix license file name in hash file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
