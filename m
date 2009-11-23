From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 23 Nov 2009 19:10:51 +0000 (UTC)
Subject: [Buildroot] How do I configure the kernel?
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com>
	<he7s4s$330$1@ger.gmane.org> <87tywmffxl.fsf@macbook.be.48ers.dk>
Message-ID: <heemnr$jrk$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-11-22, Peter Korsgaard <jacmet@uclibc.org> wrote:

> Grant> The next question was going to be where do I put a kernel
> Grant> .config file if I already have one I want to use.  I can
> Grant> probably do a "find" to search for files named .config and
> Grant> figure out which is the right one. Then I assume I do "make
> Grant> linux26-oldconfig"?
>
> Use the LINUX26_KCONFIG environment variable, similar to
> BUSYBOX_CONFIG_FILE / UCLIBC_CONFIG_FILE. I'll also update the doc about
> that one.

Sorry to be so dense, but I still don't get it.  I've got a
.config file I want to use as the starting point for a
"make oldconfig".  I can point LINUX26_KCONFIG at that .config
file, but how do I do the "make oldconfig" step?

-- 
Grant Edwards                   grante             Yow! Here we are in America
                                  at               ... when do we collect
                               visi.com            unemployment?
