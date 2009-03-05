From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 06 Mar 2009 00:35:05 +0100
Subject: [Buildroot] (apparently) HUGE kernel
Message-ID: <49B061A9.7020404@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I'm trying to build a modest linux-2.6.28.7 kernel for a VIA C3 based
router/firewall which will boot from CF-card.

I've removed everything I can think of that is superfluous for my
application, things like virtualization, various things to support SMP,
almost all debug options, etc.  I've only left the IPV4 networking,
netfilter, QoS, a bit of USB support, etc.

Still the kernel (bzImage) is 12MB large.  gah.  On my Fedora10 system the
kernel is 2.5MB large.  A 12MB kernel isn't the end of the world, but it
just seems too large.

I would be grateful if someone could have a look at my config-file and
possibly offer an explanation.  The config file is here:

	http://www.spielwiese.de/rob/Buildroot/linux-config

cheers,

Rob Urban
