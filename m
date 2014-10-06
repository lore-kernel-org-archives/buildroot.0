From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 17:03:42 -0300
Subject: [Buildroot] [PATCH 3/5] gnupg2: add hash file
In-Reply-To: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412625824-2350-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg2/gnupg2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gnupg2/gnupg2.hash

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
new file mode 100644
index 0000000..62fdaee
--- /dev/null
+++ b/package/gnupg2/gnupg2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0	gnupg-2.0.26.tar.bz2
-- 
2.0.4
