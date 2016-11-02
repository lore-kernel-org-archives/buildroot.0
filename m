From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:25:09 +0100
Subject: [Buildroot] [git commit] sshpass: bump version to 1.06
Message-ID: <20161102162525.069427FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=964c620ae9ae758ffb357eac648dc22aa20ea552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Add -P for overriding the password prompt we search for
- Add -v for verbose logging of the prompt detection prompt.
- Allow packagers and compilers to change the default password prompt.
- When giving -V, also print the default password prompt.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sshpass/sshpass.hash | 2 +-
 package/sshpass/sshpass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index 12871e1..f6e0611 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e  sshpass-1.05.tar.gz
+sha256  c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60  sshpass-1.06.tar.gz
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index 7344ca6..de46604 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHPASS_VERSION = 1.05
+SSHPASS_VERSION = 1.06
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
 SSHPASS_LICENSE = GPLv2+
 SSHPASS_LICENSE_FILES = COPYING
