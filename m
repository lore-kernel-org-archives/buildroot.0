From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:03 -0300
Subject: [Buildroot] [PATCH 002/113] dos2unix: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dos2unix/dos2unix.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dos2unix/dos2unix.hash

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
new file mode 100644
index 0000000..7880f1d
--- /dev/null
+++ b/package/dos2unix/dos2unix.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	551afe005a86e58664b4f41327408e73afafe92400488dd0aab1dad6deb4e72b	dos2unix-7.0.tar.gz
-- 
2.3.6
