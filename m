From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 16:53:22 +0200
Subject: [Buildroot] [PATCH 3/5] docs/manual: python is no longer a
 mandatory dependency
In-Reply-To: <cover.1572101547.git.yann.morin.1998@free.fr>
References: <cover.1572101547.git.yann.morin.1998@free.fr>
Message-ID: <b117ab24579f753206cb20d2a73f3bec66afa286.1572101547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index dcd3fd255e..a32fdbfbc6 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,6 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.7 or any later)
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
@@ -45,6 +44,14 @@ between distributions).
 
 === Optional packages
 
+* Recommended dependencies:
++
+Some features or utilities in Buildroot, like the legal-info, or the
+graph generation tools, have additional dependencies. Although they
+are not mandatory for a simple build, they are still highly recommended:
++
+** +python+ (version 2.7 or any later)
+
 * Configuration interface dependencies:
 +
 For these libraries, you need to install both runtime and development
-- 
2.20.1
