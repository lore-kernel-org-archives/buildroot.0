From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:53:54 +0100
Subject: [Buildroot] [git commit] filemq: correct license
Message-ID: <20170320205452.AE7DE8018D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=205a0289d4a0aefc76b0c937c2f725517114c658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All source files, except src/filemq_client.c and src/filemq_server.c,
has MPL Version 2.0 license text in file header.

As confirmed with upstream [1] (L)GPLv3 license texts COPYING and
COPYING.LESSER are leftover from previous implementation.

[1] - https://github.com/zeromq/filemq/issues/74

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
