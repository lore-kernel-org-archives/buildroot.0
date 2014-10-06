From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 17:03:43 -0300
Subject: [Buildroot] [PATCH 4/5] libgcrypt: add hash file
In-Reply-To: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412625824-2350-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libgcrypt/libgcrypt.hash

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
new file mode 100644
index 0000000..2ce7a67
--- /dev/null
+++ b/package/libgcrypt/libgcrypt.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2014q3/000355.html
+sha1	cc31aca87e4a3769cb86884a3f5982b2cc8eb7ec	libgcrypt-1.6.2.tar.bz2
-- 
2.0.4
