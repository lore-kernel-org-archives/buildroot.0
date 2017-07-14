From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:13:47 +0200
Subject: [Buildroot] [git commit] nginx-upload: bump version to fix build
	against nginx-1.12.x
Message-ID: <20170714131104.05CEA7F9CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5f3eb0bc229893de883fdd8863851e68a1f1be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9ec/9ecf714667736bf61f643ad55588d3d6ebdde603/
http://autobuild.buildroot.net/results/cea/cea64e30e98543e10c8819f6337babfec6d7ac0f/

Bump to the latest commit on the 2.255 branch, which contains pull request
88 (work with latest nginx versions):

https://github.com/vkholodkov/nginx-upload-module/pull/88

git shortlog aba1e3f34c754551f4f49e572bc86863d535609d..
Anton (1):
      Add files via upload

Valery Kholodkov (5):
      Added tag for version 2.0.8
      Recreated tag for version 2.0.8
      Backported to nginx 0.5.37 by Anthony Kholodkov
      Updated Changelog
      Merge pull request #88 from antonbarinov/2.255

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-upload/nginx-upload.hash | 2 +-
 package/nginx-upload/nginx-upload.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-upload/nginx-upload.hash b/package/nginx-upload/nginx-upload.hash
index 4fc4347..3a8dfed 100644
--- a/package/nginx-upload/nginx-upload.hash
+++ b/package/nginx-upload/nginx-upload.hash
@@ -1,2 +1,2 @@
 #Locally Computed:
-sha256 8cd1d9d968ffba807de2e546ea9cad5e1ae294ec60b4927b2d60a98bdb4a1144  nginx-upload-aba1e3f34c754551f4f49e572bc86863d535609d.tar.gz
+sha256 5f1c3c2b9858b9cacd877a0f2df9b9263734e9cef8d837b73f0e659c0f7fde2d  nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3.tar.gz
diff --git a/package/nginx-upload/nginx-upload.mk b/package/nginx-upload/nginx-upload.mk
index ef67995..7385425 100644
--- a/package/nginx-upload/nginx-upload.mk
+++ b/package/nginx-upload/nginx-upload.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_UPLOAD_VERSION = aba1e3f34c754551f4f49e572bc86863d535609d
+NGINX_UPLOAD_VERSION = 70bee48f1811eecd255ed094ce9f0fb560c390c3
 NGINX_UPLOAD_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_VERSION))
 NGINX_UPLOAD_LICENSE = BSD-3-Clause
 NGINX_UPLOAD_LICENSE_FILES = LICENCE
