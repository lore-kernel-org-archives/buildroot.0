From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 22:10:01 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170607212720.GA23160@scaer> (Yann E. MORIN's message of "Wed, 
 7 Jun 2017 23:27:20 +0200")
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com>
 <20170607212720.GA23160@scaer>
Message-ID: <87h8zq9r6u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Waldemar, Thomas, All,
 > On 2017-06-06 21:35 +0200, Thomas Petazzoni spake thusly:
 >> On Tue, 6 Jun 2017 19:56:59 +0200, Waldemar Brodkorb wrote:
 >> > We do not support uClibc-ng/musl C library version choice support,
 >> > do the same for GNU C Library.
 >> > Add me as Maintainer for the package.
 >> > 
 >> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> 
 >> On this one, I'd like to have the opinion of others. Arnout? Peter?
 >> Yann? What do you think about this?
 >> 
 >> I don't have a very clear-cut opinion about this one.

 > Neither do I.

 > On principle, I agree that we should drop versions. But glibc is part of
 > the toolchain, and the toolchain has always been special.

 > True, we do not have a version for uClibc-ng, but we do have some
 > traction on the maintainer! ;-) So we know things are gonna be fixed
 > soonish, or that we can grab a temporary backport, both very easily.

 > Not so much for glibc in my experience...

True, but I also don't recall any package breakage because of issues in
newer glibc versions (as glibc is "standard").

I also don't feel strongly about it, but it is true that it would limit
the number of combinations and be more in line with musl/uClibc-ng, so
I'm OK with doing it.

-- 
Bye, Peter Korsgaard
