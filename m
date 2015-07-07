From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jul 2015 09:52:31 -0300
Subject: [Buildroot] [PATCH 3/4] transmission: add hash file
In-Reply-To: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436273552-2877-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/transmission/transmission.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/transmission/transmission.hash

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
new file mode 100644
index 0000000..4199b37
--- /dev/null
+++ b/package/transmission/transmission.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb	transmission-2.84.tar.xz
-- 
2.3.6
