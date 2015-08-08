From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:07 -0000
Subject: [Buildroot] [git commit branch/next] monkey: remove the default
	value of the MONKEY_SOURCE variable
Message-ID: <20150808105638.2B07780414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53fa8d3ecb0680ad8bf44072493e61f26fa8b0a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monkey/monkey.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 419750e..31e8846 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -6,7 +6,6 @@
 
 MONKEY_VERSION_MAJOR = 1.5
 MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
-MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
 MONKEY_LICENCE = Apache-2.0
 MONKEY_LICENCE_FILE = LICENSE
