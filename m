From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:30 +0100
Subject: [Buildroot] [PATCH 4/7] docs/manual: remove FAQ entry about
	'depends on' vs. 'select'
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1356792153-24033-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FAQ is before the section on package development, and only covers
user issues, not developer issues, so the FAQ entry about 'depends on'
vs. 'select' really doesn't have its place here.

And the 'depends on' vs. 'select' issue is already covered in a later
section, see
http://buildroot.org/downloads/manual/manual.html#depends-on-vs-select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq-troubleshooting.txt |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 5a22702..5d9531b 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -89,17 +89,6 @@ If you need documentation data on your target anyway, then Buildroot
 is not suitable for your purpose, and you should look for a _real
 distribution_ (see: xref:faq-no-compiler-on-target[]).
 
-[[faq-depends-on-vs-select]]
-+Config.in+: _depends on_ vs _select_
--------------------------------------
-
-When adding a new package to Buildroot, you will most likely have to
-deal with expressing the dependencies of this package.
-
-In the +Config.in+ file, dependencies may be expressed following two
-semantics.
-See xref:depends-on-vs-select[choosing between _depends_ and _select_].
-
 [[faq-why-not-visible-package]]
 Why are some packages not visible in the Buildroot config menu?
 ---------------------------------------------------------------
-- 
1.7.9.5
