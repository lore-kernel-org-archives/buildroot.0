From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 22:08:41 +0200
Subject: [Buildroot] [git commit] lttng-libust: rename cxx-tests patch so
	the other patches gets used as well
Message-ID: <20120404200933.3B6ED96A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8fcdcc041d547e9ac2b4fe243e8a7febf905097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-dont-build-cxx-tests-when-not-available.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
similarity index 100%
rename from package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
rename to package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
