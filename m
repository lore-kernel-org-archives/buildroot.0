From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:22:27 +0100
Subject: [Buildroot] [PATCH 1/6] Kickoff 2013.05 cycle
In-Reply-To: <cover.1361143078.git.yann.morin.1998@free.fr>
References: <cover.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <4bf3c452a507d4997f869875e4fd412a3af1a5cd.1361143078.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <jacmet@sunsite.dk>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 3f967b2..1300725 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.02-rc1
+export BR2_VERSION:=2013.05-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
-- 
1.7.2.5
