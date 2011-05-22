From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] kbd: rename the makefile so that it's
	named the same as the package
Message-ID: <20110522145942.721308356F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4b3e8a71c14c2442670299c8d75356b747c4b157
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kbd/{kdb.mk => kbd.mk} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/kbd/{kdb.mk => kbd.mk} (100%)

diff --git a/package/kbd/kdb.mk b/package/kbd/kbd.mk
similarity index 100%
rename from package/kbd/kdb.mk
rename to package/kbd/kbd.mk
-- 
1.7.3.4
