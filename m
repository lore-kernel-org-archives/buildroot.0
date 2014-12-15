From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 19:00:12 -0300
Subject: [Buildroot] [PATCH 2/2] ncurses: add hash file
In-Reply-To: <1418680812-24778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418680812-24778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418680812-24778-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/ncurses.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ncurses/ncurses.hash

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
new file mode 100644
index 0000000..482b2d4
--- /dev/null
+++ b/package/ncurses/ncurses.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b	ncurses-5.9.tar.gz
-- 
2.0.4
