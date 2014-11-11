From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:40:41 +0100
Subject: [Buildroot] [git commit] rt-tests: rename patch to the new
	convention
Message-ID: <20141111144147.53582B40EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94d5d3d90d820a8d0d2360adf862315e5a7c3b52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As a preparation to the introduction of an additional patch to rt-tests,
let's rename the existing patch to the new naming convention.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uild-system.patch => 01-fix-build-system.patch} |    0
 .../{rt-tests-uclibc.patch => 02-uclibc.patch}     |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/rt-tests-fix-build-system.patch b/package/rt-tests/01-fix-build-system.patch
similarity index 100%
rename from package/rt-tests/rt-tests-fix-build-system.patch
rename to package/rt-tests/01-fix-build-system.patch
diff --git a/package/rt-tests/rt-tests-uclibc.patch b/package/rt-tests/02-uclibc.patch
similarity index 100%
rename from package/rt-tests/rt-tests-uclibc.patch
rename to package/rt-tests/02-uclibc.patch
