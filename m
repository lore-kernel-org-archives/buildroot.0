From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:13:58 +0200
Subject: [Buildroot] [git commit] qt5base: rename patch to avoid conflict on
	0002
Message-ID: <20150516131800.0EEE07FD9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e22719ad5ccb691241c457524472b7e99568a86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are currently two patches with the 0002 sequence number, which
isn't great. Rename one of them to use the 0003 sequence number.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...kspecs-files.patch => 0003-mkspecs-files.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0002-mkspecs-files.patch b/package/qt5/qt5base/0003-mkspecs-files.patch
similarity index 100%
rename from package/qt5/qt5base/0002-mkspecs-files.patch
rename to package/qt5/qt5base/0003-mkspecs-files.patch
