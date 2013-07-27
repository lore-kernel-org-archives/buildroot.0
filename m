From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:20:33 +0200
Subject: [Buildroot] [git commit] tstools: add missing comment when
	!BR2_LARGEFILE
Message-ID: <20130727142028.3215C9AC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=519f7fbb1e1fb6bf8d59b6ec544bf1f19cf57dcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tstools/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 58f3df1..1ca67bf 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -15,3 +15,6 @@ config BR2_PACKAGE_TSTOOLS
 	  used to store data on DVDs.
 
 	  http://tstools.berlios.de/
+
+comment "tstools needs largefile support in toolchain"
+	depends on !BR2_LARGEFILE
