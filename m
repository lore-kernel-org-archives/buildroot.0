From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 20 Jul 2011 17:10:12 +0100
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
Message-ID: <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, 2011-07-20 at 15:38 +0200, Thomas De Schampheleire wrote:
> >
> >> * I need to be able to compile external kernel modules, so in that
> >> Makefile I need to point to the right kernel directory.
> >
> > Ok. Those could be integrated as Buildroot packages, in which case
> > getting access to the Linux source directory is easy.
> 
> Good point. I'll have to add Mercurial support in buildroot to get there though.

I may be misinterpreting, but does the above mean that you have a decent
generic external kernel module build structure going?  I have a terribly
hacky setup working here but it's completely incompatible with the
recent linux GENTARGETS approach.
Care to share your external module build stuff?
