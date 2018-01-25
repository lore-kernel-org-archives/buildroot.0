From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 21:49:30 +0100
Subject: [Buildroot] [git commit] lighttpd: add hash for the license file
Message-ID: <20180125205008.F309B839A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ccf6ed9f4b36e736a06b5087826234874737099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 5d221b3..813d1cd 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,4 @@
 # From http://www.lighttpd.net/
 sha256 0f8ad5aac7529d7b948b9d7e8cd0b4a9e177309d85d6bf6516e28e6e40d74f36  lighttpd-1.4.48.tar.xz
+# Locally calculated
+sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
