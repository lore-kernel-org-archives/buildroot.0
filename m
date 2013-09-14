From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 07:35:14 +0200
Subject: [Buildroot] running gtk programs fail
In-Reply-To: <52330AFB.1050204@rosho.de>
References: <52330AFB.1050204@rosho.de>
Message-ID: <20130914073514.6a5f3954@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Bergmann,

On Fri, 13 Sep 2013 14:54:19 +0200, Frank Bergmann wrote:

> I'm trying to use the gtk toolkit and running into trouble.
> If I start a small test program
> (https://developer.gnome.org/gtk-tutorial/stable/c39.html#SEC-HELLOWORLD)
> the window appears but no button. Also I'm unable to close the
> window. Starting /usr/bin/gtk-demo fail too, nothing happens
> (no window). I use xorg (modular) and fluxbox, blackbox and
> enlightenment  work properly.
> 
> Did I miss something or is libgtk broken ?

Hum, unfortunately there is too little details here to help you. Are
you running gtk-demo from a terminal? If so, are there any messages
appearing?

Usually, when doing some X.org, testing I do something like:

X -someoptions &
export DISPLAY=:0
gtk-demo

from the serial port console. This way, you can see which messages are
displayed by gtk-demo.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
