From: Ben Kloosterman <bklooste@gmail.com>
Date: Wed, 5 May 2010 15:10:07 +0800
Subject: [Buildroot] How to create a non mmu toolchain
In-Reply-To: <876332df2k.fsf@macbook.be.48ers.dk>
References: <20100504211440.530E48D361@busybox.osuosl.org>	<03af01caebda$ba829b80$2f87d280$@com>
	<876332df2k.fsf@macbook.be.48ers.dk>
Message-ID: <03ec01caec22$0049a4f0$00dceed0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx for your reply .

So which chain supports Nommu ?

Br no mmu support
Crosstool no mmu support. 
Ct-ng no mmu 
Uclinux support but requires a no mmu tool chain. 

Building a toolchain by hand.

The reason why we dont want to use an mmu is complex , there is a thread on
it in ucLinux but basically building a type safe , memory safe micro kernel
OS since we run a single address space with compiler based checks an MMU
just becomes an overhead. Rather than the green field code we have been
working on for 2 years we can start with uClinux which will help things
along . 

Regards, 

Ben


 >-----Original Message-----
 >From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
 >Korsgaard
 >Sent: Wednesday, May 05, 2010 2:43 PM
 >To: bklooste at gmail.com
 >Cc: buildroot at busybox.net
 >Subject: Re: How to create a non mmu toolchain
 >
 >>>>>> "Ben" == Ben Kloosterman <bklooste@gmail.com> writes:
 >
 > Ben> How to create an i386/686 or x86-64 No mmu ( eg ARCH-USE-MMU =
 >false)
 > Ben> toolchain ?
 >
 >Sorry, we don't have any non-mmu support. Why would you not want to use
 >the MMU on the i386/x86-64?
 >
 >--
 >Bye, Peter Korsgaard
