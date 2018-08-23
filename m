From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:05:37 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] docs/manual: update host
 gcc minimum required version
Message-ID: <20180823215801.3B7F18E4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20d363fb9e85a0449ffab30cef61dc2295a45af6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The oldest gcc that is known to work with current Buildroot is that of
RHEL 6, version 4.4.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27797caf76b58aaa9ca0c4dc1044b328dbc6e829)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
