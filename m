From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 23:21:18 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{1,2}.x series
Message-ID: <20151003212214.E222F81926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d94cb7bdcd7aa10bc7638b5ca55ddf6cfb5c602
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 101f30d..2e28f78 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -201,6 +201,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.9"		if BR2_KERNEL_HEADERS_4_1
-	default "4.2.2"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.10"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.3"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
