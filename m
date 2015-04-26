From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 14:26:37 +0200
Subject: [Buildroot] [PATCH 2/2] python3: add hash file
In-Reply-To: <1430051197-27220-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430051197-27220-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1430051197-27220-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python3/python3.hash

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
new file mode 100644
index 0000000..60ac230
--- /dev/null
+++ b/package/python3/python3.hash
@@ -0,0 +1,4 @@
+# From https://www.python.org/downloads/release/python-343/
+md5 7d092d1bba6e17f0d9bd21b49e441dd5 Python-3.4.3.tar.xz
+# Locally computed
+sha256 b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8 Python-3.4.3.tar.xz
-- 
2.1.0
