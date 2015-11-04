From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:48:36 +0100
Subject: [Buildroot] [git commit] package/nginx: fix a typo
Message-ID: <20151104204853.D13AA81E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=407d77e9c1448a9eec9669346bac33218c3b29be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/nginx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 32a337c..8e23bd8 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -19,7 +19,7 @@ NGINX_CONF_OPTS = \
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
-# See system/skeleton/passwd
+# See system/skeleton/etc/passwd
 #   username: www-data    uid: 33
 #   groupname: www-data   gid: 33
 #
