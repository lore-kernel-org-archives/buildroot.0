From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 20:08:53 +0200
Subject: [Buildroot] [git commit] poco: add license information
Message-ID: <20120801183817.C054996F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e320e94106e852d114c562ad644a0b5956e64e0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/poco.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 779487f..f74c2b1 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -6,6 +6,8 @@
 POCO_VERSION = 1.4.3p1
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/poco
+POCO_LICENSE = Boost-v1.0
+POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
 
 POCO_DEPENDENCIES = zlib pcre					\
