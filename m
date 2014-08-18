From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:02:31 +0200
Subject: [Buildroot] [git commit] arch/microblaze: always has atomic ops
Message-ID: <20140818090640.566ED9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85da209efbc4ce6fd542d6493d28fcaf8bf6d942
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.microblaze |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 2d4c1fe..7c21dfc 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -9,3 +9,6 @@ config BR2_ENDIAN
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
