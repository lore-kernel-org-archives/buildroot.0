From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 22:25:32 +0100
Subject: [Buildroot] [PATCH 1/1] php: intl support needs dynamic library
In-Reply-To: <20181110215930.10530-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Nov 2018 22:59:30 +0100")
References: <20181110215930.10530-1-fontaine.fabrice@gmail.com>
Message-ID: <87lg5b60fn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > getArgTypeList is defined in ext/intl/msgformat/msgformat_helpers.cpp

s/in/in both/

> and icu library so add a !BR2_STATIC_LIBS dependency to
 > BR2_PACKAGE_PHP_EXT_INTL

 > Fixes:
 >  - http://autobuild.buildroot.org/results/628b677d1ceb8b404265d89357225e0a1dce1407

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
