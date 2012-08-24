From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:35:15 +0200
Subject: [Buildroot] [git commit] Mention that BR2_SOURCEFORGE_MIRROR is
	deprecated
Message-ID: <20120824213544.1F61297086@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d660fa32ad67b861ccb30d50a58c511b7999a6cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index b18c927..4a7e6b5 100644
--- a/Config.in
+++ b/Config.in
@@ -151,6 +151,10 @@ config BR2_SOURCEFORGE_MIRROR
 	string "Sourceforge mirror site"
 	default "kent"
 	help
+	  Note: the usage of this variable is deprecated. Packages
+	  should instead use the http://downloads.sourceforge.net/ URL
+	  which automatically chooses a working mirror
+
 	  Sourceforge has a system of mirror sites.  Some sites may be
 	  closer to your location, and sometimes mirror sites go down
 	  and are no longer available.  This option allows you to select
