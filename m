From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 21:24:30 +0200
Subject: [Buildroot] [git commit] ntp: rename patches to follow BR guidelines
Message-ID: <20140718192436.0B5769D270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca4e58ffbf21c61794502d81bc002b2b97bbfebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{ntp-adjtimex.patch => ntp-001-adjtimex.patch} |    0
 package/ntp/{ntp-nano.patch => ntp-002-nano.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/ntp/ntp-adjtimex.patch b/package/ntp/ntp-001-adjtimex.patch
similarity index 100%
rename from package/ntp/ntp-adjtimex.patch
rename to package/ntp/ntp-001-adjtimex.patch
diff --git a/package/ntp/ntp-nano.patch b/package/ntp/ntp-002-nano.patch
similarity index 100%
rename from package/ntp/ntp-nano.patch
rename to package/ntp/ntp-002-nano.patch
