From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:46 +0200
Subject: [Buildroot] [git commit] perf: fix typo and syntax error
Message-ID: <20141015125351.D01C9B2DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a205003928fa3b6917d41013525601a42e711ca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perf/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/perf/Config.in b/package/perf/Config.in
index 703b48f..083086b 100644
--- a/package/perf/Config.in
+++ b/package/perf/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_PERF
 
 	  This package builds and install the userspace 'perf'
 	  command. It is up to the user to ensure that the kernel
-	  configuration has all suitable options enable to allow a
+	  configuration has all the suitable options enabled to allow a
 	  proper operation of 'perf'.
 
 	  https://perf.wiki.kernel.org/
