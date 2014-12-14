From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 21:40:35 +0100
Subject: [Buildroot] [git commit] package/tvheadend: rename patches to new
	convention
Message-ID: <20141214205926.ACCD87FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9bf380b3252b137162ad1ca44553dd7bc819ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eck_config.patch => 0001-no-check_config.patch} |    0
 ...emove-werror.patch => 0002-remove-werror.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
similarity index 100%
rename from package/tvheadend/tvheadend-002-no-check_config.patch
rename to package/tvheadend/0001-no-check_config.patch
diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/0002-remove-werror.patch
similarity index 100%
rename from package/tvheadend/tvheadend-003-remove-werror.patch
rename to package/tvheadend/0002-remove-werror.patch
