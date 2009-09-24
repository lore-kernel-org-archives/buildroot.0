From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Sep 2009 12:27:22 +0200
Subject: [Buildroot] mpfr-2.4.1.patch not found
In-Reply-To: <4ABB135A.5010408@cetoncorp.com> (Austin Foxley's message of
	"Wed\, 23 Sep 2009 23\:36\:10 -0700")
References: <1253772735.451.111.camel@station1.ormlab.com>
	<4ABB135A.5010408@cetoncorp.com>
Message-ID: <87r5tw63jp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Austin" == Austin Foxley <austinf@cetoncorp.com> writes:

 Austin> On 09/23/2009 11:12 PM, Ormund Williams wrote:
 >> /bin/sh: ./../dl/mpfr-2.4.1.patch: No such file or directory
 >> make: *** [.../buildroot/output/toolchain/mpfr-2.4.1/.unpacked] Error 1
 >> 
 >> Where is this patch suppose to come from?

 Austin> http://www.mpfr.org/mpfr-2.4.1/mpfr-2.4.1.patch I would think, but that gives me
 Austin> a 404 currently.

http://www.mpfr.org/mpfr-2.4.1/patches to be exact, but we rename that
unlucky filename to mpfr-2.4.1.patch after downloading (see mpfr.mk).

It's on the mirror as well:

http://buildroot.net/downloads/sources/mpfr-2.4.1.patch

-- 
Bye, Peter Korsgaard
