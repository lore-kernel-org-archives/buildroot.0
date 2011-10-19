From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Wed, 19 Oct 2011 11:59:40 +0100
Subject: [Buildroot] [PATCH] sh: Add ttySC* to securetty
Message-ID: <1319021980-8180-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 fs/skeleton/etc/securetty |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index fd0ec8e..6c07d7f 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -40,3 +40,9 @@ ttyO3
 ttyAM0
 ttyAM1
 ttyAM2
+ttySC0
+ttySC1
+ttySC2
+ttySC3
+ttySC4
+ttySC5
-- 
1.7.0.4
