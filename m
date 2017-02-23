From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:28:52 +0100
Subject: [Buildroot] Ethernet not working with imx6ulevk
In-Reply-To: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
References: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
Message-ID: <20170223212852.00f314f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 14:30:54 +0000, Taceant Omnes wrote:

> Has anybody got Ethernet working with imx6ulevk?
> 
> Some context. Ethernet does not work (out of the box) with the imx6ul
> evaluation kit.

That really isn't a Buildroot question, but more a Linux kernel
question.

> # does not work
> $ uname -a
> Linux imx6ulevk 4.1.15-1.1.0+ga4d2a08 #1 SMP PREEMPT Fri Apr 1
> 06:06:13 CST 2016 armv7l GNU/Linux

Since you're using the Freescale-specific Linux kernel (as can be
guessed from the 4.1.15 version), you should contact Freescale support
or the Freescale community to get help.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
