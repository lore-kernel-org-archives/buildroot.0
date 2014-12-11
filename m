From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 12 Dec 2014 00:27:45 +0100
Subject: [Buildroot] [PATCH 1/3] iprutils: rename patches to follow the new
	name convention
Message-ID: <1418340467-29999-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...iprutils-0001-Don-t-use-gettext.patch => 0001-Don-t-use-gettext.patch} | 0
 ...nviro.patch => 0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch} | 0
 ...ies-i.patch => 0003-Fix-static-build-by-passing-the-libraries-i.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/iprutils/{iprutils-0001-Don-t-use-gettext.patch => 0001-Don-t-use-gettext.patch} (100%)
 rename package/iprutils/{iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch => 0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch} (100%)
 rename package/iprutils/{iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch => 0003-Fix-static-build-by-passing-the-libraries-i.patch} (100%)

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
-- 
1.9.3
