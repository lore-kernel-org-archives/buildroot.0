From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:36:10 +0200
Subject: [Buildroot] [git commit] Config.in: Add BR2_DEPRECATED_SINCE_2016_08
Message-ID: <20160618133629.828D8819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=995da6ea9b4e2257b1e8646883c3dfdaaf341548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for new deprecated features/symbols.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 9fa7415..820b1f0 100644
--- a/Config.in
+++ b/Config.in
@@ -385,6 +385,10 @@ config BR2_DEPRECATED_SINCE_2016_05
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2016_08
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
