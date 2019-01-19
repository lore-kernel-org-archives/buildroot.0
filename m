From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:35:16 +0100
Subject: [Buildroot] [PATCH 2/2] php: switch to pcre2
In-Reply-To: <20190116210016.22121-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jan 2019 22:00:16 +0100")
References: <20190116210016.22121-1-fontaine.fabrice@gmail.com>
 <20190116210016.22121-2-fontaine.fabrice@gmail.com>
Message-ID: <87munw1gbv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > php moved from pcre to pcre2 since bump to version 7.3 and
 > http://github.com/php/php-src/commit/a5bc5aed71f7a15f14f33bb31b8e17bf5f327e2d

 > This fixes a build failure: without this change, if BR2_PACKAGE_PCRE is
 > set, external pcre support in php is (wrongly) enabled with
 > --with-pcre-regex but because pcre2 was not found, php fallbacks on
 > built-in pcre2 without the "SLJIT_SINGLE_THREADED hack"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/40ef339019203d2cc49d388e222cf17c3ca37944

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
