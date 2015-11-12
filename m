From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 08:52:23 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <20151111225820.GB3968@free.fr> (Yann E. MORIN's message of "Wed, 
 11 Nov 2015 23:58:20 +0100")
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <20151111235359.707acc35@free-electrons.com>
 <20151111225820.GB3968@free.fr>
Message-ID: <87wptnods8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Those build failures are not caused by a 32 bits vs. 64 bits issue. In
 >> fact, I started running my chroot under "linux32", but it was even
 >> worse. Because indeed my chroots *are* 64 bits.

 > OK, but still, in a 32-bit chroot, in the linux32 personality, we were
 > trying to use the 64-bit variant of the toolchain. And I observed the
 > same symptom as the autobuild failures.

How can that be? With linux32 uname -m returns 'ix86', right?

-- 
Venlig hilsen,
Peter Korsgaard 
