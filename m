From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 22:16:41 +0100
Subject: [Buildroot] [PATCH] website: add pointers to the PGP signatures for
	releases
Message-ID: <1389647801-452-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Peter has just pointed me to the PGP signatures of the release tarballs,
which exist since he's been doing releases.

This was not obvious to me that the releases were signed, as there was
no info about it on the website.

So, add such links on the downloads page.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 docs/download.html | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/download.html b/docs/download.html
index b9a9fcf..4cf44cc 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -10,8 +10,10 @@ The latest stable release is <b>2013.11</b>, which can be downloaded
 here:<p>
 
 <a href="/downloads/buildroot-2013.11.tar.gz">buildroot-2013.11.tar.gz</a>
+(<a href="/downloads/buildroot-2013.11.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2013.11.tar.bz2">buildroot-2013.11.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11.tar.bz2">buildroot-2013.11.tar.bz2</a>
+(<a href="/downloads/buildroot-2013.11.tar.bz2.sign">PGP signature</a>).
 
 <p>
 <!--
@@ -19,11 +21,13 @@ The latest release candidate is <b>2013.11-rc3</b>, which can be
 downloaded here:<p>
 
 <a href="/downloads/buildroot-2013.11-rc3.tar.gz">buildroot-2013.11-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2013.11-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2013.11-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 -->
-This and earlier releases can always be downloaded from
+This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
-- 
1.8.1.2
