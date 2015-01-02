From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 13:20:49 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: rename patches to follow
	the new name convention
Message-ID: <20150102122055.E0FF580816@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8b275b5dbc4ec51ed49a19f544696814898455e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ames.patch => 0001-Fix-generate-keynames.patch} |    0
 ...patch => 0002-Fix-compiler-warning-flags.patch} |    0
 ....patch => 0003-support-static-only-build.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch b/package/dvb-apps/0001-Fix-generate-keynames.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
rename to package/dvb-apps/0001-Fix-generate-keynames.patch
diff --git a/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
rename to package/dvb-apps/0002-Fix-compiler-warning-flags.patch
diff --git a/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch b/package/dvb-apps/0003-support-static-only-build.patch
similarity index 100%
rename from package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
rename to package/dvb-apps/0003-support-static-only-build.patch
