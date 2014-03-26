From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 00:45:27 +0100
Subject: [Buildroot] [git commit] cups: rename patches to follow BR
	guidelines
Message-ID: <20140326234558.22AED9C30E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09b0b7d73f709fc0e2c5bbee47c4edcb877dfd7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h => cups-0002-fix-stack-protector-check.patch} |    0
 ...s-mantohtml.patch => cups-0003-mantohtml.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/cups/cups-fix-stack-protector-check.patch b/package/cups/cups-0002-fix-stack-protector-check.patch
similarity index 100%
rename from package/cups/cups-fix-stack-protector-check.patch
rename to package/cups/cups-0002-fix-stack-protector-check.patch
diff --git a/package/cups/cups-mantohtml.patch b/package/cups/cups-0003-mantohtml.patch
similarity index 100%
rename from package/cups/cups-mantohtml.patch
rename to package/cups/cups-0003-mantohtml.patch
