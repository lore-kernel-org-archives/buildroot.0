From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 00:37:44 +0200
Subject: [Buildroot] [PATCH 45/53] rt-test: add license information
In-Reply-To: <1403810481-10025-45-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 16:21:13 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-45-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uocemdj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/rt-tests/rt-tests.mk | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
 > index e6455d5..e7dabdb 100644
 > --- a/package/rt-tests/rt-tests.mk
 > +++ b/package/rt-tests/rt-tests.mk
 > @@ -4,9 +4,11 @@
 >  #
 >  ################################################################################
 
 > -RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
 > +RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
 >  RT_TESTS_VERSION = 0.83
 > -RT_TESTS_SOURCE  = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
 > +RT_TESTS_SOURCE = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
 > +RT_TESTS_LICENSE = GPLv2+
 > +RT_TESTS_LICENSE_FILEs = COPYING

Should be upper case 'S' in _FILES.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
