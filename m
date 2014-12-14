From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 19:55:17 +0100
Subject: [Buildroot] [git commit] iprutils: rename patches to follow the new
	name convention
Message-ID: <20141214194750.692FF7FFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=336a8458154a6c9d4642e1ee7616cd60dce36959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-gettext.patch => 0001-Don-t-use-gettext.patch} |    0
 ...ow-CFLAGS-to-be-extended-from-the-enviro.patch} |    0
 ...-static-build-by-passing-the-libraries-i.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/iprutils/iprutils-0001-Don-t-use-gettext.patch b/package/iprutils/0001-Don-t-use-gettext.patch
similarity index 100%
rename from package/iprutils/iprutils-0001-Don-t-use-gettext.patch
rename to package/iprutils/0001-Don-t-use-gettext.patch
diff --git a/package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch b/package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
similarity index 100%
rename from package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
rename to package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
diff --git a/package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch b/package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
similarity index 100%
rename from package/iprutils/iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch
rename to package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
