From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:46 -0000
Subject: [Buildroot] [git commit branch/next] grep: bump to version 2.13
Message-ID: <20120802195250.52CD196FF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e163bcb2aaa498b4afdc0ce5a91dac443692a69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 389aa3b..31ccaa6 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GREP_VERSION = 2.12
+GREP_VERSION = 2.13
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
