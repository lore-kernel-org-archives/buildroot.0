From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jan 2019 13:10:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsquish: add license file hash
Message-ID: <20190112121024.27896-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.14.5
