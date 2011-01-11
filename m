From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Jan 2011 10:49:56 -0300
Subject: [Buildroot] [PATCH] target skeleton: add audio group
Message-ID: <1294753796-4848-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add audio group to the target skeleton.
Some multimedia applications based on alsa-lib need it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index c600be0..df12dba 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -6,6 +6,7 @@ adm:x:4:
 tty:x:5:
 disk:x:6:
 wheel:x:10:root
+audio:x:29:
 utmp:x:43:
 staff:x:50:
 haldaemon:x:68:
-- 
1.7.3.4
