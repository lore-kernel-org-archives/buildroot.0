From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:44:44 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libsquish: add
 license file hash
Message-ID: <20190124154615.D84928E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8001021a162b710d1275b950b13a4032b3ec02e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b377e9dcfbad9025cfcc87d95735a61bd8722ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsquish/libsquish.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
index e68d28d66f..06c96e977b 100644
--- a/package/libsquish/libsquish.hash
+++ b/package/libsquish/libsquish.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/libsquish/files
 sha1 51844b9a8bc815a27e2cc0ffbede5fee3ef75110 libsquish-1.15.tgz
 md5 c02645800131e55b519ff8dbe7284f93 libsquish-1.15.tgz
+# Locally calculated
+sha256 a6b8c383bf3ab28460d6507484d605dd722e03971606f0cd3032a3af682b63a5  LICENSE.txt
