From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 00:00:16 +0200
Subject: [Buildroot] [git commit] package/debianutils: improve help text
Message-ID: <20150721220028.358DD801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02084cdf948ce1a0781a9a54c51b7705454ee3a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a note about the installed utilities.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/debianutils/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
index f865868..c4f2fcf 100644
--- a/package/debianutils/Config.in
+++ b/package/debianutils/Config.in
@@ -4,4 +4,7 @@ config BR2_PACKAGE_DEBIANUTILS
 	help
 	  Miscellaneous utilities specific to Debian.
 
+	  The specific utilities included are: add-shell installkernel
+	  ischroot remove-shell run-parts savelog tempfile which.
+
 	  https://tracker.debian.org/pkg/debianutils
