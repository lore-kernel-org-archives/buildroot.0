From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:13:05 +0200
Subject: [Buildroot] [git commit] exfat-utils: indicate upstream status of
	the musl patch
Message-ID: <20150727211334.0F4848041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efc54fe91ebd849618a15363602b84e53e15037d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-compiling-with-non-glibc-libcs.patch  |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
index 6244b16..d280040 100644
--- a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
+++ b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
@@ -3,6 +3,9 @@
 libexfat would only compile on Linux with __GLIBC__ defined. Changed
 to use __linux__ which likely better fits the original intent.
 
+Upstream status: applied.
+See https://groups.google.com/forum/#!topic/exfat/8g3yumqrf1A.
+
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
 ---
  platform.h |    2 +-
