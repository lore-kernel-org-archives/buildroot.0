From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 22:47:29 +0100
Subject: [Buildroot] [git commit] package/fmt: bump version to 7.1.3
Message-ID: <20201203092228.56B44821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a110a5cf4b3d915dfc8bdb7e0a12a84cb9798fbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1], [2], [3] and [4].

[1] https://github.com/fmtlib/fmt/releases/tag/7.1.0
[2] https://github.com/fmtlib/fmt/releases/tag/7.1.1
[3] https://github.com/fmtlib/fmt/releases/tag/7.1.2
[4] https://github.com/fmtlib/fmt/releases/tag/7.1.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 1f45c212f3..7947a17456 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  decfdf9ad274070fa85f26407b816f5a4d82205ae86bac1990be658d0795ea4d  fmt-7.0.3.zip
+sha256  5d98c504d0205f912e22449ecdea776b78ce0bb096927334f80781e720084c9f  fmt-7.1.3.zip
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 0539dcc024..000bacfd7b 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 7.0.3
+FMT_VERSION = 7.1.3
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
