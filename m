From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 21:07:39 +0200
Subject: [Buildroot] [git commit] privoxy: bump version to 3.0.26
Message-ID: <20160905190813.355867F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f243fc5c2e9d36f7b60ab45f1575f9b2ff341923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/privoxy/privoxy.hash | 6 +++---
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index aea8f2d..72226b1 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.24%20%28stable%29/
-md5	44a47d1a5000db8cccd61ace0e25e7f7	privoxy-3.0.24-stable-src.tar.gz
-sha1	343c547a9e795ff029a78310963e0c04448975ee	privoxy-3.0.24-stable-src.tar.gz
+# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.26%20%28stable%29/
+md5 8a1c842112ccea68c19b7ceb4a0e999f  privoxy-3.0.26-stable-src.tar.gz
+sha1 b646624006225979f83453ba542e448667f45998  privoxy-3.0.26-stable-src.tar.gz
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 4b5a1a6..267ddc2 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.24
+PRIVOXY_VERSION = 3.0.26
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
