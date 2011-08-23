From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:06 +0200
Subject: [Buildroot] [PATCH 2/9] fs/skeleton: add cyrus user in group mail
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/passwd |    1 +
 fs/skeleton/etc/shadow |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/passwd b/fs/skeleton/etc/passwd
index ed7006a..ef34441 100644
--- a/fs/skeleton/etc/passwd
+++ b/fs/skeleton/etc/passwd
@@ -11,6 +11,7 @@ operator:x:37:37:Operator:/var:/bin/sh
 haldaemon:x:68:68:hald:/:/bin/sh
 dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
+cyrus:x:88:8:cyrus:/home:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
 sshd:x:103:99:Operator:/var:/bin/sh
 default:x:1000:1000:Default non-root user:/home/default:/bin/sh
diff --git a/fs/skeleton/etc/shadow b/fs/skeleton/etc/shadow
index 67b67c1..6849579 100644
--- a/fs/skeleton/etc/shadow
+++ b/fs/skeleton/etc/shadow
@@ -9,5 +9,6 @@ halt:*:10933:0:99999:7:::
 uucp:*:10933:0:99999:7:::
 operator:*:10933:0:99999:7:::
 ftp:*:10933:0:99999:7:::
+cyrus:*:10933:0:99999:7:::
 nobody:*:10933:0:99999:7:::
 default::10933:0:99999:7:::
-- 
1.7.4.1
