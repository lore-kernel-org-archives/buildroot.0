From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2021 21:45:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.5p2
In-Reply-To: <87ft2mxuuw.fsf@tarshish> (Baruch Siach's message of "Wed, 27 Jan
 2021 17:28:07 +0200")
References: <20210127142628.40494-1-christian@paral.in>
 <87ft2mxuuw.fsf@tarshish>
Message-ID: <87lfce5csz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Christian,
 > On Wed, Jan 27 2021, Christian Stewart wrote:

 > [...]

 >> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
 >> index 88a1274b34..7a6320e7e4 100644
 >> --- a/package/sudo/sudo.mk
 >> +++ b/package/sudo/sudo.mk
 >> @@ -10,7 +10,7 @@ SUDO_LICENSE = ISC, BSD-3-Clause
 >> SUDO_LICENSE_FILES = doc/LICENSE
 >> SUDO_CPE_ID_VALID = YES
 >> SUDO_CPE_ID_VERSION = 1.9.5
 >> -SUDO_CPE_ID_VERSION_MINOR = p1
 >> +SUDO_CPE_ID_VERSION_MINOR = p2
 >> # We're patching lib/eventlog/Makefile.in
 >> SUDO_AUTORECONF = YES

 > Can we drop that now?

Gaah, I applied and pushed before seeing your reply. Given that we are
no longer patching sudo I would expect so.

I'll add a followup fix, thanks.

-- 
Bye, Peter Korsgaard
