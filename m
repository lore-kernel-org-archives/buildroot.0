From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 07:22:17 +0100
Subject: [Buildroot] [git commit] ti-uim: add license file
Message-ID: <20170314062357.D35967FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=405f7ee89a9bc69d4c467ac68290b6dfb618eccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the absence of full license text file, take a short source file that
mentions the license in its comment header.

[Peter: add DEVELOPERS entry]
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS               | 1 +
 package/ti-uim/ti-uim.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70a5428..e08b65d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -141,6 +141,7 @@ F:	package/sigrok-cli/
 N:	Baruch Siach <baruch@tkos.co.il>
 F:	package/ebtables/
 F:	package/openipmi/
+F:	package/ti-uim/
 
 N:	Ben Boeckel <mathstuf@gmail.com>
 F:	package/taskd/
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index a6e19b8..66b93e4 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -7,6 +7,7 @@
 TI_UIM_VERSION = a0236bc252e6484835ce266ae4a50b361f6a902d
 TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
 TI_UIM_LICENSE = GPLv2+
+TI_UIM_LICENSE_FILES = uim.h
 
 define TI_UIM_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
