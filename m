From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 21 Nov 2009 05:00:12 +0000 (UTC)
Subject: [Buildroot] How do I configure the kernel?
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com>
Message-ID: <he7s4s$330$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-11-20, Nicholas Walton <nwalton@aplopteng.com> wrote:
> On Fri, Nov 20, 2009 at 2:23 PM, Grant Edwards
><grant.b.edwards@gmail.com> wrote:
>> How do you configure the kernel when using buildroot?
>
> make linux26-menuconfig

Doh!  I trield make kernel-menuconfig and several other
variations.  For future reference, is there somewhere that's
documented?

The next question was going to be where do I put a kernel
.config file if I already have one I want to use.  I can
probably do a "find" to search for files named .config and
figure out which is the right one. Then I assume I do "make
linux26-oldconfig"?

> Other targets, such as Busybox, follow the same convention.

Yes, the docs do explain how to configure busybox and uclibc.
I just hadn't guessed the correct "label" for doing the same
thing for the kernel.

-- 
Grant
