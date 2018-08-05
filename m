From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  5 Aug 2018 13:13:31 +0300
Subject: [Buildroot] [PATCH] docs/manual: update host gcc minimum required
 version
Message-ID: <9d4d4477b77d5fea865f0b0e76982ac483665ac2.1533464011.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The oldest gcc that is known to work with current Buildroot is that of
RHEL 6, version 4.4.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/prerequisite.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fdae..66e1b88f1654 100644
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
2.18.0
