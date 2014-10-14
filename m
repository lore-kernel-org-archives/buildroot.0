From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:43 -0300
Subject: [Buildroot] [PATCH 06/16] rsync: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsync/rsync.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rsync/rsync.hash

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
new file mode 100644
index 0000000..032047d
--- /dev/null
+++ b/package/rsync/rsync.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621	rsync-3.1.1.tar.gz
-- 
2.0.4
