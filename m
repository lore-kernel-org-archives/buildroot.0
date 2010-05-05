From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 05 May 2010 08:42:59 +0200
Subject: [Buildroot] How to create a non mmu toolchain
In-Reply-To: <03af01caebda$ba829b80$2f87d280$@com> (Ben Kloosterman's message
	of "Wed, 5 May 2010 06:39:56 +0800")
References: <20100504211440.530E48D361@busybox.osuosl.org>
	<03af01caebda$ba829b80$2f87d280$@com>
Message-ID: <876332df2k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ben" == Ben Kloosterman <bklooste@gmail.com> writes:

 Ben> How to create an i386/686 or x86-64 No mmu ( eg ARCH-USE-MMU = false)
 Ben> toolchain ?

Sorry, we don't have any non-mmu support. Why would you not want to use
the MMU on the i386/x86-64?

-- 
Bye, Peter Korsgaard
