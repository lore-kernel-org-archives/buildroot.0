From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 10:39:36 +0100
Subject: [Buildroot] [git commit] tvheadend: fix typo in patch description
Message-ID: <20131204094013.455149BF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff51f3734b905a09d75960d8b67c233bede1af3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tvheadend-004-dont-run-compiled-code.patch     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
index f559583..8125db1 100644
--- a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
+++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
@@ -2,7 +2,7 @@ support: don't try to run compiled code
 
 When cross-compiling, we can't run the compiled code.
 
-Consider the compiler returning succes as an indication
+Consider the compiler returning success as an indication
 it is working.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
