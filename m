From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 22:33:02 +0200
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <50119743.3090505@zacarias.com.ar>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar>
Message-ID: <20120726223302.4f773e96@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jul 2012 16:15:15 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> > After this bump, I build tested a large number of the ncurses reverse
> > dependencies we have in Buildroot, and they all built fine.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Nack.
> The version bump to 5.8 and 5.9 had issues in the past and still has.
> It may compile just fine but it segfaults miserably in a target, chroot
> or qemu image.
> Simple test, i586 target with external toolchain, build less and see.
> Regards.

Yes, I just did some runtime testing, and also faced segfaults. Now
that you say it, I also remember what you said.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
