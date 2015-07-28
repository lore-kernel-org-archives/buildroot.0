From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:00 -0300
Subject: [Buildroot] [PATCH 059/113] mtools: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-59-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtools/mtools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mtools/mtools.hash

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
new file mode 100644
index 0000000..5d86498
--- /dev/null
+++ b/package/mtools/mtools.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85	mtools-4.0.18.tar.bz2
-- 
2.3.6
