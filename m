From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 3 Dec 2016 21:24:13 +0100
Subject: [Buildroot] how to activate usb keyboard?
In-Reply-To: <CAKuBZxum0H3oJcND9rnz_hP5A-voxZRpVzgZX-ZL0pyDQ-rmZg@mail.gmail.com>
References: <CAKuBZxtBUYYF2FzaFu+WQ4c=7rtixDsRb1n=NcpeMne8o+UvNQ@mail.gmail.com>
 <20161202212550.2dda6f27@gmx.net>
 <CAKuBZxum0H3oJcND9rnz_hP5A-voxZRpVzgZX-ZL0pyDQ-rmZg@mail.gmail.com>
Message-ID: <20161203212413.43d8dc45@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Azik,

please keep the buildroot mailing list on CC...

On Sat, 3 Dec 2016 11:32:54 +0300, Azik Aziz <azizazik@gmail.com> wrote:

> Hello Friend!
> 
> I am using this assembly here https://github.com/pbouda/brummbeere
> 
> I'm here this board https://cdn.sparkfun.com//assets/parts/7/4/9/7/11546-01.jpg
> 
> This assembly is tuned to the operating system quick boot
> 

Nice and interesting project....but will decrease your chance to get help because
it is not a original (and up to date) buildroot release...

But never less maybe I can give you some help ;-)

Did you compile the compile brummbeere yourself? Using which defconfig?

Did your mean the console on the attached LCD Display or console on the HDMI port?

I observed (with another project but similar LCD) the the HDMI console stops working
when the LCD kernel support module is loaded (no more output on HDMI console) but
everything worked well without the LCD kernel module...

In my case (blind) login via the USB keyboard worked, easy to test:
- login (blind) as root
- type 'reboot' and press enter and wait for reboot (or first login otherwise
  (vial network or serial console or on the LCD if possible and start 'tail -f /var/log/messages')

Regards,
Peter
 
> 2016-12-02 23:25 GMT+03:00, Peter Seiderer <ps.report@gmx.net>:
> > Hello Azik,
> >
> > On Fri, 2 Dec 2016 08:38:34 +0300, Azik Aziz <azizazik@gmail.com> wrote:
> >
> >> Hi!
> >>
> >> There is a ready assembled, the image buildroot rpi.
> >>
> >> I can not enter a command through a usb keypad (I can not type the
> >> command).
> >>
> >> Can not write command and the console (I can not type the command).
> >>
> >> linux terminal is operating normally
> >>
> >> I can see through the system load monitor rca
> >>
> >> I can see the way the system load through the console putty
> >>
> >> On keyboard working ctrl-alt-del for reset only
> >>
> >> how to enter the command on console?
> >>
> >> how to activate usb keyboard?
> >
> > Mhhh, should work out of the box, but there were some problems regarding
> > console working with RPi's in the past...
> >
> > Which RPi board? A/B/B+ Rpi3 etc? Which buildroot version? Which
> > defconfig used?
> >
> > Regards,
> > Peter
> >
> >
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
