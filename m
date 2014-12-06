From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Dec 2014 10:56:27 +0100
Subject: [Buildroot] [PATCH 3/3] fconfig: add hash file
In-Reply-To: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417859787-31970-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add locally computed hash file for fconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fconfig/fconfig.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fconfig/fconfig.hash

diff --git a/package/fconfig/fconfig.hash b/package/fconfig/fconfig.hash
new file mode 100644
index 0000000..eae26e2
--- /dev/null
+++ b/package/fconfig/fconfig.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7 fconfig-20080329.tar.gz
-- 
2.1.0
