From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 20 Mar 2017 20:41:18 +0530
Subject: [Buildroot] [PATCH 2/3] filemq: correct license
In-Reply-To: <1490022679-28301-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490022679-28301-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490022679-28301-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All source files, except src/filemq_client.c and src/filemq_server.c,
has MPL Version 2.0 license text in file header.

As confirmed with upstream [1] (L)GPLv3 license texts COPYING and
COPYING.LESSER are leftover from previous implementation.

[1] - https://github.com/zeromq/filemq/issues/74

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/filemq/filemq.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index d57208e..62ddfaf 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -11,8 +11,8 @@ FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = filemq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
-FILEMQ_LICENSE = LGPLv3+ with exceptions
-FILEMQ_LICENSE_FILES = COPYING COPYING.LESSER
+FILEMQ_LICENSE = MPLv2.0
+FILEMQ_LICENSE_FILES = LICENSE
 
 define FILEMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
-- 
2.6.2
