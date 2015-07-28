From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:40 -0300
Subject: [Buildroot] [PATCH 039/113] libraw1394: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-39-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libraw1394/libraw1394.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libraw1394/libraw1394.hash

diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
new file mode 100644
index 0000000..5d18e98
--- /dev/null
+++ b/package/libraw1394/libraw1394.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
+sha256	e3dc814bc8014cc0bd306767c15e686c9b3b07fcacbbf62862fb1c1de2d708a4	libraw1394-2.0.7.tar.xz
-- 
2.3.6
