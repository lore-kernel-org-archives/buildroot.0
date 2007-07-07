From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 12:21:19 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
In-Reply-To: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
Message-ID: <20070707102119.GP4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 02:35:32PM +0200, Ulf Samuelsson wrote:
>Now, when I have access, I would like to understand the proper
>procedure to add patches.

>The patches I'd like to add are mainly:

>* A few extra packages.

Which packages are you going to add?

>* Bump versions on a number of packages which has disappeared from their download location.
>        (dash, rmp, l2tp, mpfr,mrouted, openntpd, portage, pppd,udev)

Ok, a general thing that we do _not_ want to do is to accumulate too
many patches, as a general rule of thumb. Please, please try to push
patches to upstream, otherwise version bumps are getting cumbersome over
time. Obviously it is a good thing to improve a package, but upstream
authors/maintainers should fix their stuff and not rely on their users
to repeatedly fixup on behalf of the real maintainer.


>Best Regards
>Ulf Samuelsson                ulf at atmel.com
>Atmel Nordic AB
>Mail:  Box 2033, 174 02 Sundbyberg, Sweden
>Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
>Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
>GSM    +46 (706) 22 44 57
>
>Technical support when I am not available:
>AT90 AVR Applications Group: mailto:avr at atmel.com
>AT91 ARM Applications Group: mailto:at91support at atmel.com
>AVR32 Applications Group        mailto:avr32 at atmel.com
>http://www.avrfreaks.net/;            http://avr32linux.org/
>http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
