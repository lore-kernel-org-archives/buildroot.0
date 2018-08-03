From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 00:06:18 +0200
Subject: [Buildroot] [PATCH 1/3] docs/manual: add flex+bison to
 pre-requisites
In-Reply-To: <cover.1533333972.git.yann.morin.1998@free.fr>
References: <cover.1533333972.git.yann.morin.1998@free.fr>
Message-ID: <e46b168daba5486329166279765dcbdb51bd3787.1533333972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fd..0867e4d619 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -24,7 +24,8 @@ between distributions).
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
 ** +gcc+ (version 2.95 or any later)
-** `g++` (version 2.95 or any later)
+** `bison`
+** `flex`
 ** +bash+
 ** +patch+
 ** +gzip+
-- 
2.14.1
