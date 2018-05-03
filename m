From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:52:17 +0200
Subject: [Buildroot] [git commit] libldns: add hash for license file
Message-ID: <20180503195234.EBCE98B532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aec3ab44d6b07a04168ef8f9f32ddcf2ecdd4895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libldns/libldns.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index dc6b1a341a..f20bb4be59 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -2,3 +2,6 @@
 sha1 ceeeccf8a27e61a854762737f6ee02f44662c1b8  ldns-1.7.0.tar.gz
 # From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.0.tar.gz.sha256
 sha256 c19f5b1b4fb374cfe34f4845ea11b1e0551ddc67803bd6ddd5d2a20f0997a6cc  ldns-1.7.0.tar.gz
+
+# Hash for license file:
+sha256 9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
