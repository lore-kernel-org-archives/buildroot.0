From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:05 +0200
Subject: [Buildroot] [PATCH 1/9] fs/skeleton: add mail group
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index 311a455..dd3ea3d 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -5,6 +5,7 @@ sys:x:3:
 adm:x:4:
 tty:x:5:
 disk:x:6:
+mail:x:8:
 wheel:x:10:root
 audio:x:29:
 utmp:x:43:
-- 
1.7.4.1
