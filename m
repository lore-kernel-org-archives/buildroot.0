From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:35:11 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20160601213516.1032181DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2229ff2b5f9805a5dd9015853a840616ab1d69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 9406d08..0479971 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	50ada2f30387f9526e1ed453f778686b443e599841a73a031cdd543b65e7a502	tvheadend-cd9f07fb865e5700156546ee326fbaf42ee99cf8.tar.gz
+sha256	b6035c0eedfdcbec965116248471c23bed7f8b7f899e403d670495325002ba78	tvheadend-8e637f9f903f6d820f701a1461b144e67665c6fa.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 07577d0..516cbd3 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = cd9f07fb865e5700156546ee326fbaf42ee99cf8
+TVHEADEND_VERSION = 8e637f9f903f6d820f701a1461b144e67665c6fa
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
