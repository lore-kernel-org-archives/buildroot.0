From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 08:01:48 +0100
Subject: [Buildroot] [git commit] pptp-linux: rename patches to remove the
	version number
Message-ID: <20130204213436.828349A939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f72c65a3ae83ffd3d5e3bf0367d53daf437bea28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...acy.patch => pptp-linux-001-susv3-legacy.patch} |    0
 ...pts.patch => pptp-linux-002-drop-stropts.patch} |    0
 ...-ip-path.patch => pptp-linux-003-ip-path.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
similarity index 100%
rename from package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
rename to package/pptp-linux/pptp-linux-001-susv3-legacy.patch
diff --git a/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch b/package/pptp-linux/pptp-linux-002-drop-stropts.patch
similarity index 100%
rename from package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
rename to package/pptp-linux/pptp-linux-002-drop-stropts.patch
diff --git a/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch b/package/pptp-linux/pptp-linux-003-ip-path.patch
similarity index 100%
rename from package/pptp-linux/pptp-linux-1.7.2-ip-path.patch
rename to package/pptp-linux/pptp-linux-003-ip-path.patch
