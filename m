From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:56:35 +0200
Subject: [Buildroot] [git commit] docs/manual: relax python version
	requirement
Message-ID: <20150714215703.A7BFB80E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe3f30d9a7c989194ab58a99d04eed785fb9eef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot should now work with host installed python version 3. Update the
manual accordingly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/prerequisite.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 6ee01b4..7edad1f 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,7 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.6 or 2.7)
+** +python+ (version 2.6 or any later)
 ** +unzip+
 ** +rsync+
 
