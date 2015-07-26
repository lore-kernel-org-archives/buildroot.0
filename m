From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:33 +0200
Subject: [Buildroot] [PATCH 07/12] libllcp: Bump version and change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, libllcp has already made the move to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libllcp/libllcp.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index e0dbb83..2c2014a 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
-LIBLLCP_SITE = https://libllcp.googlecode.com/git
-LIBLLCP_SITE_METHOD = git
+LIBLLCP_VERSION = 05dfa8003433a7070bfd8ae02efdb0203bbf34aa
+LIBLLCP_SITE = $(call github,nfc-tools,libllcp,$(LIBLLCP_VERSION))
 LIBLLCP_DEPENDENCIES = host-pkgconf libnfc
 # There's no ./configure in the repository, so we need to autoreconf
 LIBLLCP_AUTORECONF = YES
-- 
2.1.4
