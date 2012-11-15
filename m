From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 16:39:31 +0100
Subject: [Buildroot] [git commit] uClibc: update uClibc-snapshot.config to
	recent uClibcs
Message-ID: <20121115154218.C6FC09A015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86f6987bf7bc1bd9eae3c2a9ffa427cc87da9bbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index eb39df6..71fa472 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -93,6 +93,7 @@ LDSO_PRELOAD_ENV_SUPPORT=y
 # LDSO_PRELINK_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
+LDSO_SAFE_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
 LDSO_LD_LIBRARY_PATH=y
 # LDSO_NO_CLEANUP is not set
