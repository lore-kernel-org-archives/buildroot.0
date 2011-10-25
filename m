From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 09:10:30 -0300
Subject: [Buildroot] [PATCH 1/2] securetty: update to add ttySC for sh4
Message-ID: <1319544631-31988-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/skeleton/etc/securetty |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index fd0ec8e..4ab956f 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -40,3 +40,5 @@ ttyO3
 ttyAM0
 ttyAM1
 ttyAM2
+ttySC0
+ttySC1
-- 
1.7.3.4
