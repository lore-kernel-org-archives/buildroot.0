From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 22 Mar 2012 20:18:14 +0000
Subject: [Buildroot] [PATCH] Add www-data user group
Message-ID: <1332447494-9937-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index 311a455..d6b7f23 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -7,6 +7,7 @@ tty:x:5:
 disk:x:6:
 wheel:x:10:root
 audio:x:29:
+www-data:x:33:
 utmp:x:43:
 staff:x:50:
 haldaemon:x:68:
-- 
1.7.5.4
