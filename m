From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Oct 2010 16:53:20 +0200
Subject: [Buildroot] Can't compile lsof: no rpc.h ?
In-Reply-To: <201010221553.14210.dargaud@lpsc.in2p3.fr> (Guillaume Dargaud's
	message of "Fri, 22 Oct 2010 15:53:14 +0200")
References: <201010221340.41660.dargaud@lpsc.in2p3.fr>
	<201010221553.14210.dargaud@lpsc.in2p3.fr>
Message-ID: <87sjzy1dpb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 Guillaume> Sorry about that, a make clean solved it.

Good. I was just about to ask you if you had enabled the RPC option
without recompiling the toolchain, because it works here.

-- 
Bye, Peter Korsgaard
