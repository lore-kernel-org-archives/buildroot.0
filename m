From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 7 Sep 2019 13:20:09 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/linux-headers:
 fix whitespace error in Config.in.host
Message-ID: <20190907111715.A45C78B523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eccfb3e425ef0ea56dfcd53402446b488bf65b69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The cherry-pick from master introduced a space-before-tab error. This is
reported by check-package.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/287919259

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2a408dc33c..ed2b967acc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -291,7 +291,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.190"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.141"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.69"	if BR2_KERNEL_HEADERS_4_19
- 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
+	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
