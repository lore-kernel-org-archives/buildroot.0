From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:50:13 +0200
Subject: [Buildroot] [git commit] logsurfer: needs mmu
Message-ID: <20130926151558.E6FE39B892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8a5d84130fa7afb2f7cda10c7c0edec2cb3ae5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/logsurfer/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
index 27d1881..d4218bc 100644
--- a/package/logsurfer/Config.in
+++ b/package/logsurfer/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LOGSURFER
 	bool "logsurfer"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Logsurfer is a program for monitoring system logs in real-time,
 	  and reporting on the occurrence of events.
