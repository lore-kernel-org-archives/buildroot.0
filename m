From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:38:23 +0100
Subject: [Buildroot] [git commit] dmalloc: rename patches to the new naming
	convention
Message-ID: <20150104204046.4152E8042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e86fba1b5d9047b6b10cb1e0eb2bdf09ec37381
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...oc-5.4.3-add-fpic.patch => 0001-add-fpic.patch} |    0
 .../{dmalloc-mips.patch => 0002-mips.patch}        |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/dmalloc/dmalloc-5.4.3-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
similarity index 100%
rename from package/dmalloc/dmalloc-5.4.3-add-fpic.patch
rename to package/dmalloc/0001-add-fpic.patch
diff --git a/package/dmalloc/dmalloc-mips.patch b/package/dmalloc/0002-mips.patch
similarity index 100%
rename from package/dmalloc/dmalloc-mips.patch
rename to package/dmalloc/0002-mips.patch
