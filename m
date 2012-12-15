From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 19:06:38 +0100
Subject: [Buildroot] [git commit] util-linux: rename versioned patch without
	version
Message-ID: <20121215201828.F2F618C004@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f23953d8cf7e136366e044166e6c02558d23b477
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

util-linux-2.20.1-sscanf-no-ms-as.patch has a version in its name, and
therefore the other patch, unversioned,
util-linux-uclibc-build-fix.patch, never gets applied.

Fix this by renaming util-linux-2.20.1-sscanf-no-ms-as.patch to
util-linux-sscanf-no-ms-as.patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...s-as.patch => util-linux-sscanf-no-ms-as.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch b/package/util-linux/util-linux-sscanf-no-ms-as.patch
similarity index 100%
rename from package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch
rename to package/util-linux/util-linux-sscanf-no-ms-as.patch
