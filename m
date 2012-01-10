From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Jan 2012 16:12:34 +0100
Subject: [Buildroot] [git commit] Add ttyGS0 to securetty
Message-ID: <20120110195326.52C58901F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60033b8f88b477841239fc383349eea5c357fb99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
