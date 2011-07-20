From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 21:23:27 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
 <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
Message-ID: <20110720212327.583a7b31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 17:10:12 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> I may be misinterpreting, but does the above mean that you have a decent
> generic external kernel module build structure going?  I have a terribly
> hacky setup working here but it's completely incompatible with the
> recent linux GENTARGETS approach.
> Care to share your external module build stuff?

Could you detail what problems you have, and give an example of an
external kernel module for which the GENTARGETS approach is a problem ?
The linux-fusion package in Buildroot is an external kernel module and
seems to build fine.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
