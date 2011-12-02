From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 2 Dec 2011 12:15:08 -0000
Subject: [Buildroot] 2011.11 zlib headers problem?
In-Reply-To: <2DEA474F53884F0AA751ABAD42769383@beraninstruments.com.local>
References: <2DEA474F53884F0AA751ABAD42769383@beraninstruments.com.local>
Message-ID: <DAC204EF7EE84F359328546B86282CFD@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Will Moore
> Sent: 02 December 2011 11:35
> 
> In 2011.08 using internal uclibc toolchain, zlib headers zlib.h and zconf.h
> were
> put in the output/host/usr/i486-unknown-linux-uclibc/sysroot/usr/include
> directory.
> 
> In 2011.11 using buildroot built crosstool-ng glibc toolchain, the zlib
> headers
> are no longer in the
> output/host/usr/i486-unknown-linux-uclibc/sysroot/usr/include directory.  I
> can
> see them in the zlib build directory.
> 
> I have started a 2011.11 internal uclibc toolchain build to narrow down the
> variables somewhat having clearly changed too many things at once...

2011.11 using internal uclibc toolchain puts zlib headers in
output/host/usr/i486-unknown-linux-uclibc/sysroot/usr/include directory OK.

So this is a internet / crosstool-NG toolchain thing and not a 2011.08 / 2011.11
thing?

> 
> Other than the obvious gentargets call (infrastructure related) change in
> zlib.mk I can't see a difference in the zlib package files between 2011.08 /
> 2011.11.
> 
> I appreciate I can just copy the missing headers across but isn't something
> going wrong here?
> 
> 
> Will
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
