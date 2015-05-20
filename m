From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:25 +0200
Subject: [Buildroot] [PATCH 6/7] package/usbredir: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/usbredir/usbredir.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/usbredir/usbredir.hash

diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
new file mode 100644
index 0000000..8328bb5
--- /dev/null
+++ b/package/usbredir/usbredir.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 028184960044ea4124030000b3c55a35c3238835116e3a0fbcaff449df2c8edf usbredir-0.6.tar.bz2
-- 
2.4.1
