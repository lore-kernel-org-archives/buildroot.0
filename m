From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 19:24:30 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to 1.0.12
In-Reply-To: <20160201162022.GA8040@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 1 Feb 2016 17:20:22 +0100")
References: <20160201162022.GA8040@waldemar-brodkorb.de>
Message-ID: <87si1cb869.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > New release contains a security fix for the resolver library parts.
 > It contains exp10(), so some patches in buildroot might be obsolete,
 > when the buildroot toolchains are rebuild.
 > It also contains a fix for the symbol clashing with bind9.

Committed, thanks.

Once the uclibc-based autobuilder toolchains have been rebuilt we can
indeed get rid of package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch

-- 
Bye, Peter Korsgaard
