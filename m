From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 May 2009 19:25:27 +0200
Subject: [Buildroot] [PATCH 5/5] cups: remove version number from patches
In-Reply-To: <1242321927-10185-4-git-send-email-jacmet@sunsite.dk>
References: <1242321927-10185-1-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-2-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-3-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-4-git-send-email-jacmet@sunsite.dk>
Message-ID: <1242321927-10185-5-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.2
