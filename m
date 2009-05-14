From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 May 2009 17:24:31 +0200
Subject: [Buildroot] [git commit] cups: remove version number from patches
Message-ID: <20090514152747.8C73277807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfcfcc1ca8336b1344304e87326998ff0b168ed9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-1.3.5-mantohtml.patch => cups-mantohtml.patch} |    0
 ...-no-tests-man.patch => cups-no-tests-man.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/cups/{cups-1.3.5-mantohtml.patch => cups-mantohtml.patch} (100%)
 rename package/cups/{cups-1.3.5-no-tests-man.patch => cups-no-tests-man.patch} (100%)

diff --git a/package/cups/cups-1.3.5-mantohtml.patch b/package/cups/cups-mantohtml.patch
similarity index 100%
rename from package/cups/cups-1.3.5-mantohtml.patch
rename to package/cups/cups-mantohtml.patch
diff --git a/package/cups/cups-1.3.5-no-tests-man.patch b/package/cups/cups-no-tests-man.patch
similarity index 100%
rename from package/cups/cups-1.3.5-no-tests-man.patch
rename to package/cups/cups-no-tests-man.patch
-- 
1.6.0.6
