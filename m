From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri,  3 Jun 2016 08:16:00 -0500
Subject: [Buildroot] [PATCH] make: Correct hash type
Message-ID: <1464959760-65290-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hash published in the make release emails is a md5sum, not a
sha1sum. Locally verified the downloaded file checks against the md5sum
after verifying the signature

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/make/make.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/make/make.hash b/package/make/make.hash
index 528822f..81f7044 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,4 +1,4 @@
 # From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html
-sha1 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
+md5 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
 # Locally calculated after checking signature
 sha256 4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f  make-4.2.tar.bz2
-- 
1.9.1
