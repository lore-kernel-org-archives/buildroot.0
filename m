From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 25 Jul 2011 21:12:35 +0000
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and external toolchain
In-Reply-To: <87r55e15gb.fsf@macbook.be.48ers.dk>
References: <F9C551623D2CBB4C9488801D14F864C6047C5D@ex-mb1.corp.adtran.com>
 <87r55e15gb.fsf@macbook.be.48ers.dk>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6047CB6@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
> Yes, I noticed as well today. Unfortunately it isn't as simple as
> making
> copy_toolchain_lib_root a noop with static linking, as E.G. glibc
> afaik
> still needs libnss*.so* in the target rootfs when static linking is
> used.

Really?  What are the libnss*-pic.a for then?

Also, another bone of contention is that I'm getting header files
in the target.  Where does that happen?

Andy
