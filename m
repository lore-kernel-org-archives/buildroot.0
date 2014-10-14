From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:40 -0300
Subject: [Buildroot] [PATCH 03/16] nettle: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nettle/nettle.hash

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
new file mode 100644
index 0000000..34c3862
--- /dev/null
+++ b/package/nettle/nettle.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40	nettle-2.7.1.tar.gz
-- 
2.0.4
