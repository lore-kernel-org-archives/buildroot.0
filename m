From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Mar 2012 16:19:09 +0200
Subject: [Buildroot] DNS and static ip
In-Reply-To: <CALo-6+jx5kYrPK26BR0b=vdLg11LGQnhonWXEUJU+-0RnKD2iw@mail.gmail.com>
References: <CALo-6+jx5kYrPK26BR0b=vdLg11LGQnhonWXEUJU+-0RnKD2iw@mail.gmail.com>
Message-ID: <20120330161909.49b269c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Mar 2012 07:15:22 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> I am searching for a little knowledge on DNS with staticIP addresses
> in busybox.
> 
> Is there a setting, like "nameserver = 8.8.8.8" that can be added to
> /etc/network/interfaces when one uses static ip addresses in busybox
> or said differently "What is the proper way to deal with DNS in
> busybox with static ip addresses?"

nameserver 8.8.8.8

in /etc/resolv.conf. It is not different than using dynamic addressing
with DHCP, except that in the DHCP case, the DHCP client automatically
fills this file for you.

Or maybe I did not understand your question properly?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
