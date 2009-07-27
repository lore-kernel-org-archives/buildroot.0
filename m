From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 11:17:07 +0200
Subject: [Buildroot] [git commit] Update CHANGES with recent improvements
Message-ID: <20090727095134.16014777F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=660952565ed0c76b4a2e345bb79fd553a4f53d77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mention X.org and external toolchain improvements in the CHANGES file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3b97df9..bf756a5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,15 @@
 2009.08, Not yet released:
 
+	Improvement of external toolchain support:
+	  - Support for glibc toolchains.
+	  - The toolchain configuration announced to Buildroot is
+	    verified against the real toolchain configuration.
+	  - Fixes, documentation.
+
+	Cleanup X.org support: clarified configuration options, and
+	removed mandatory dependency on useless libraries such as
+	libXt or libXaw.
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#83: liblockfile fails to compile due to eaccess redefinition
-- 
1.6.3.3
