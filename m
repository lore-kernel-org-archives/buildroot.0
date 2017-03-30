From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:17:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] filemq: correct license
Message-ID: <20170331071605.BDE76826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b277a7f0db52b02f79a29a7816169abfefd51f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

All source files, except src/filemq_client.c and src/filemq_server.c,
has MPL Version 2.0 license text in file header.

As confirmed with upstream [1] (L)GPLv3 license texts COPYING and
COPYING.LESSER are leftover from previous implementation.

[1] - https://github.com/zeromq/filemq/issues/74

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 205a0289d4a0aefc76b0c937c2f725517114c658)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
