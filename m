From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 15:41:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48721947.9020804@atmel.com>
References: <20080704222950.E76B63C61F@busybox.net>
	<873aml7ru0.fsf@macbook.be.48ers.dk> <48721947.9020804@atmel.com>
Message-ID: <20080707134115.GF15840@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 07, 2008 at 03:25:27PM +0200, Ulf Samuelsson wrote:
[snip ugly log target]
>> 
>> As mentioned earlier, it doesn't work with Makefile.autotools.in using
>> packages.
>> 
>
>Yes, but that is really not a good implementation.
>The MAKELEVEL has really nothing to do with what you
>want to use it for, it just happens to work, but
>this implementation is easily broken.

I have to agree to Ulf in this respect, fwiw.
Peter, why did you have to take MAKELEVEL into account? Perhaps we can
fix this in a better way.. (pointing me to a detailed commit-message or
to the ML archives is sufficient)
