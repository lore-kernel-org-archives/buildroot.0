From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:29:54 +0200
Subject: [Buildroot] [git commit] eeprog: add license information
Message-ID: <20140701153344.22EE99D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5c2315e690198a61f719abe9c2888144eb161a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eeprog/eeprog.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e1dd9b5..93aeb5e 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -6,6 +6,8 @@
 
 EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://www.codesink.org/download
+EEPROG_LICENSE = GPLv2+
+EEPROG_LICENSE_FILES = eeprog.c
 
 define EEPROG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
