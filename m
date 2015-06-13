From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 14:52:57 +0200
Subject: [Buildroot] [git commit] sysstat: fix hash
Message-ID: <20150613125317.1FF0C8185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=998bc7082ca667b8c62f79f6b3fcae87d2d3fbe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix brainfail: mixed hash from dev and stable versions.
Fixes:
http://autobuild.buildroot.net/results/bdc/bdce55b88a4aaff82ce0a492a0a4f49ab5b9031b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysstat/sysstat.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index a170f81..f535b54 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	4d8e6e72d057189a1660462a678d9ada	sysstat-11.0.5.tar.xz
+md5	438d607cd14357a24969633b9798d2be	sysstat-11.0.5.tar.xz
