From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 8 Jul 2008 10:26:13 +0200
Subject: [Buildroot] query about change to $(MAKE) definition
In-Reply-To: <87abgsu6x1.fsf@macbook.be.48ers.dk>
References: <20080708071048.GA23482@cloud.net.au>
	<87abgsu6x1.fsf@macbook.be.48ers.dk>
Message-ID: <20080708082613.GC21132@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 10:16:58AM +0200, Peter Korsgaard wrote:
>>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

>The easiest would actually be if would get rid of the BR2_JLEVEL stuff
>completely and just let people use -j<whatever> on the top level make
>instead, then make should handle it all automatically. Why don't we do
>it like that? Is something in the toplevel makefile broken for
>parallel builds? (I know lots of other buildroot stuff is broken for
>parallel). Then we could also get rid of the HOSTMAKE thing and it
>would all boil down to:
>
>MAKE1=$(MAKE) -j1
>
>What do you say?

See ML archives where i talked about parallel builds and toplevel
parallel builds.

HTH,
