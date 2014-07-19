From: Sylvain LG <forum@sylvainlegourr.com>
Date: Sat, 19 Jul 2014 17:35:42 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <20140719171333.2a67eb5d@free-electrons.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
 <20140719160709.2b2bcfae@free-electrons.com>
 <CAK9TtU06LT6oep-7sYZTVjpVqRbc-DN0pCMrK28f230dTirupA@mail.gmail.com>
 <20140719171333.2a67eb5d@free-electrons.com>
Message-ID: <CAK9TtU1h3RZ=j1cDXD24KjHxTMNzZbZb2w6XuqO0XNr+RXotEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I changed tty1 to ttyAMA0 and I can log now.

Only kernel messages are displayed, but no daemons messages (for instance,
"Starting sshd" or the public/private key pair generation).

Why?

Can Buildroot be set to configure more than one tty?

Thank you




2014-07-19 17:13 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sylvain LG,
>
> On Sat, 19 Jul 2014 16:42:55 +0200, Sylvain LG wrote:
>
> > I've just edited cmdline.txt: now I can see all kernel messages in a
> screen
> > session.
> >
> > But there is still no console (I mean I can't log in).
> >
> > 1 - What should I add to my conf?
>
> Change the getty configuration in "System configuration".
>
> > 2 - I edited directly cmdline.txt on the sdcard since I didn't manage to
> > make Buildroot rebuild the system with the new cmdline.txt. How can I do
> > that?
>
> No idea, that's a RasberryPi specific stuff, and I haven't done enough
> RasberryPi to remember.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140719/6679237b/attachment.html>
