From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 16:13:01 +0200
Subject: [Buildroot] [PATCH 1/4] at: add license information
In-Reply-To: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Jul 2014 17:00:36 -0300")
References: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhs95i1e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/at/at.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/at/at.mk b/package/at/at.mk
 > index 0fe5b9a..f09548d 100644
 > --- a/package/at/at.mk
 > +++ b/package/at/at.mk
 > @@ -11,6 +11,8 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 >  AT_MAKE = $(MAKE1)
 >  AT_AUTORECONF = YES
 >  AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 > +AT_LICENSE = GPLv2+
 > +AT_LICENSE_FILES = Copyright

That file lists files under GPLv2+, GPLv3+ and the NTP
license. parsetime.pl is only used for 'make test', but wouldn't the
combined license be GPLv3+ instead?

The COPYING file (which we probably should add to _LICENSE_FILES) is
GPLv2 though.

-- 
Bye, Peter Korsgaard
