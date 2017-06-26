From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 10:01:01 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] iperf: fix tarball hashes
	changed upstream
Message-ID: <20170626081140.8149D7FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d886a939ccece0e6cc5a21277b35b74d892d58b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Upstream uploaded a new tarball with the same version number 2016-09-08,
some time after the update to v2.0.9 in buildroot. Someone noticed, but
upstream set the ticket to wontfix, and promised to do better in the
future: https://sourceforge.net/p/iperf2/tickets/20/

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 62cf881a768c50e4c10c3dfce5b88f48beb6a26f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf/iperf.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 3dd491a..3e96143 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,4 +1,4 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	9e215f6af8edd97f947f2b0207ff5487845d83d4	iperf-2.0.9.tar.gz
+sha1	59820895df9106ba189ccfdc5677077535ad50e7	iperf-2.0.9.tar.gz
 # Locally computed:
-sha256  a5350777b191e910334d3a107b5e5219b72ffa393da4186da1e0a4552aeeded6  iperf-2.0.9.tar.gz
+sha256  db02911f35686e808ed247160dfa766e08ae3f59d1e7dcedef0ffb2a6643f0bf  iperf-2.0.9.tar.gz
