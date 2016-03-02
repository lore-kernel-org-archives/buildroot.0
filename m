From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 02 Mar 2016 20:27:54 -0000
Subject: [Buildroot] [git commit] package/monolinte: updating download url
Message-ID: <20160302202752.2128880203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed1cecb269668a6cd4aa0bb59341f1dc6868df8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest mono revision changed download url for monolite, updating it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monolite/monolite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 3c53bff..761e776 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONOLITE_VERSION = 138
-MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
+MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
 
