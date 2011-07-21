From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Jul 2011 18:11:02 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <201107210548.53315.minimod@morethan.org> (Michael S. Zick's
 message of "Thu, 21 Jul 2011 05:48:51 -0500")
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <87livs1xv4.fsf@macbook.be.48ers.dk> <20110721075819.5a535238@skate>
 <201107210548.53315.minimod@morethan.org>
Message-ID: <8739hz1und.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> And if one of the purposes of having a programmed build system
 Michael> is to provide a reproducible build at some future time (or
 Michael> place or by someone else); setting an environment variable
 Michael> leaves no record in the stored build system.

True, but the ccache directory (like BUILDROOT_DL_DIR) don't affect the
output, they are only local build time optimizations.

-- 
Bye, Peter Korsgaard
