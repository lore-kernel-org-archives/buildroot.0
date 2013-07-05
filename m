From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 10:32:19 +0200
Subject: [Buildroot] [git commit] eglibc: fix typo
Message-ID: <20130705083531.D38169A335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27838bcd7a0e84ac96c2d24d9cfedff3e1498512
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, a '+' sign was left at the beginning of a line in
eglibc.mk. Noticed by Gustavo Zacarias.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eglibc/eglibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index ec80d5e..bb81757 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -19,7 +19,7 @@ EGLIBC_SUBDIR = build
 
 EGLIBC_INSTALL_STAGING = YES
 
-+EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
+EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
 
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
