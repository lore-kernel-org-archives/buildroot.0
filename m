From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 18:15:33 +0200
Subject: [Buildroot] IntelCE PR18.5 install
In-Reply-To: <CAJmoUz40MAyHOR1LG8086rSOH0it53EhcwVehVqOOOfoSmy+mw@mail.gmail.com>
References: <CAJmoUz40MAyHOR1LG8086rSOH0it53EhcwVehVqOOOfoSmy+mw@mail.gmail.com>
Message-ID: <20110707181533.3e1e0f2a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tom,

Le Thu, 7 Jul 2011 11:06:23 -0400,
Tom Smith <penguin.linux1@gmail.com> a ?crit :

> We're trying to compile PR18.5 on a host machine but when I try the
> "make all" command, I get this error:

What is PR18.5 ? How is building PR18.5 on your host machine related to
Buildroot ?

> make: *** No rule to make target `cross-depmod26', needed by
> `linux26-modules'.  Stop.
> 
> Does anyone have any advice?

Yes, upgrade your Buildroot. There is not such rule linux26-modules in
the modern versions of Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
