From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Aug 2018 13:46:15 +0200
Subject: [Buildroot] [PATCH] docs/manual: gcc 4.4 is the lowest we are known
 to work with
Message-ID: <20180805114615.3442-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-2.95 is old. No, it is not old; it is antediluvian.

The odlest gcc version we are testing against is gcc-4.4 (on Holiss'
autobuilder using RHEL6.5).

Update the manual accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 docs/manual/prerequisite.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fd..66e1b88f16 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -23,8 +23,8 @@ between distributions).
 ** +make+ (version 3.81 or any later)
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
-** +gcc+ (version 2.95 or any later)
-** `g++` (version 2.95 or any later)
+** +gcc+ (version 4.4 or any later)
+** `g++` (version 4.4 or any later)
 ** +bash+
 ** +patch+
 ** +gzip+
-- 
2.14.1
