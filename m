From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 2 Dec 2016 21:25:50 +0100
Subject: [Buildroot] how to activate usb keyboard?
In-Reply-To: <CAKuBZxtBUYYF2FzaFu+WQ4c=7rtixDsRb1n=NcpeMne8o+UvNQ@mail.gmail.com>
References: <CAKuBZxtBUYYF2FzaFu+WQ4c=7rtixDsRb1n=NcpeMne8o+UvNQ@mail.gmail.com>
Message-ID: <20161202212550.2dda6f27@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Azik,

On Fri, 2 Dec 2016 08:38:34 +0300, Azik Aziz <azizazik@gmail.com> wrote:

> Hi!
> 
> There is a ready assembled, the image buildroot rpi.
> 
> I can not enter a command through a usb keypad (I can not type the command).
> 
> Can not write command and the console (I can not type the command).
> 
> linux terminal is operating normally
> 
> I can see through the system load monitor rca
> 
> I can see the way the system load through the console putty
> 
> On keyboard working ctrl-alt-del for reset only
> 
> how to enter the command on console?
> 
> how to activate usb keyboard?

Mhhh, should work out of the box, but there were some problems regarding
console working with RPi's in the past...

Which RPi board? A/B/B+ Rpi3 etc? Which buildroot version? Which
defconfig used?

Regards,
Peter


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
