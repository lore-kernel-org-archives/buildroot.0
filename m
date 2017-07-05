From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:20:27 +0200
Subject: [Buildroot] [git commit] Config.in: add BR2_HOST_GCC_AT_LEAST_7
Message-ID: <20170705142248.E75518025E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=435b4cce0f054dc4f8549d1ab89e2b45039e015b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 72ceadf..e395995 100644
--- a/Config.in
+++ b/Config.in
@@ -57,6 +57,11 @@ config BR2_HOST_GCC_AT_LEAST_6
 	default y if BR2_HOST_GCC_VERSION = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
+config BR2_HOST_GCC_AT_LEAST_7
+	bool
+	default y if BR2_HOST_GCC_VERSION = "7"
+	select BR2_HOST_GCC_AT_LEAST_6
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
