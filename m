From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 14:25:44 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
Message-ID: <20101214142544.7863d2d2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 15:06:43 +0200
Diego Iastrubni <diegoiast@gmail.com> wrote:

> I am using buitdroot to create my development environment (the
> production is something bigger and slower made manually once...). I
> am using codesourcery for arm as the toolchain. the HW (which is not
> relevant  to the scenario) is an OMAP3 device boots with my old
> firmware).
> 
> I forked (I use git and not released versions)  buildroot a few
> months and its worked after I manually mknod'ed some devices. Now I
> pulled from you guys, and now I cannot even login to my new clean
> environment (last time it was /dev/tty ,which was not correct). Does
> anyone have an idea?

What is your boot log ?

Quite likely, you should read
http://buildroot.org/downloads/buildroot.html#faq-boot-hangs, but there
may be other problems as well, of course.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
