From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jun 2008 15:06:57 +0200
Subject: [Buildroot] cris
In-Reply-To: <485F63D8.2050809@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
	<485F63D8.2050809@cetrtapot.si>
Message-ID: <20080623130657.GC8920@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 10:50:32AM +0200, Hinko Kocevar wrote:
>Hinko Kocevar wrote:
>> Bernhard Fischer wrote:
>>> [I'm changing the subject to something more suitable]

>>> I don't see this. Is that uClibc-trunk or something else?
>> 
>> Me too, will rebuild with and wo sysroot as I suspect to meka a difference..
>
>No difference. In other words, I can't install binutils 2.18 wo using sysroot.

Ah right, i don't do non-sysroot (there is simply no point in it)
anymore. It's better to just have a properly relocatable cross-compiler
anyway.

>But using gcc 4.2.3 instead of 4.3.1 does not generate the error!

You would have to look if these old gcc versions are treated separately
and adjust the new accordingly (in gcc-uclibc-3.x.mk, i.e. the
non-sysroot makefile; but you really don't want these).

HTH,
