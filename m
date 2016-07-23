From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:06:03 +0200
Subject: [Buildroot] [git commit] mpv: bump to version 0.18.1
Message-ID: <20160723130817.470F880634@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a22722ead7866716d6317916a936300edab03e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpv/mpv.hash | 2 +-
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 8d9c9d1..8a2f44b 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	b656638d4f6bce2621baaacb60d8be384aa492fcd86dfd43996aaa2c16fee02b	v0.18.0.tar.gz
+sha256	e413d57fec4ad43b9f9b848f38d13fb921313fc9a4a64bf1e906c8d0f7a46329	v0.18.1.tar.gz
 sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 7ecac9e..d2ed3f2 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.18.0
+MPV_VERSION = 0.18.1
 MPV_WAF_VERSION = 1.8.12
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
