From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 16:37:25 +0100
Subject: [Buildroot] [git commit] e2tools/host: remove hyphen
Message-ID: <20150327153739.22CB2818D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f38ed2f227dfe28637816842355b5ebb33a0225
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the other host packages that have a menu entry use a space, so make
it consistent.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2tools/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2tools/Config.in.host b/package/e2tools/Config.in.host
index 772262a..859c47b 100644
--- a/package/e2tools/Config.in.host
+++ b/package/e2tools/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_E2TOOLS
-	bool "host-e2tools"
+	bool "host e2tools"
 	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  E2tools is a simple set of GPL'ed utilities to read, write,
