From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 10 Jan 2012 15:41:38 +0100
Subject: [Buildroot] [PATCH 1/1] Add ttyGS0 to securetty
Message-ID: <1326206498-20967-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 fs/skeleton/etc/securetty |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index 6c07d7f..547ceda 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -46,3 +46,4 @@ ttySC2
 ttySC3
 ttySC4
 ttySC5
+ttyGS0
-- 
1.7.7
