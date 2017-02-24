From: Brent Sink <brents_3@hotmail.com>
Date: Fri, 24 Feb 2017 21:40:53 +0000
Subject: [Buildroot] No GPS data on ttymxc1 with busybox,
 but it works with systemd
In-Reply-To: <BY2PR03MB31431BC964FD7F0A71C5021BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
References: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>,
 <20170220095026.7150a532@free-electrons.com>,
 <BY2PR03MB31431BC964FD7F0A71C5021BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
Message-ID: <BY2PR03MB314570B07617BEF30F0C0A3BF520@BY2PR03MB314.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,

>
> Perhaps systemd is automatically initializing the serial ports to some
> given speed/configuration.
>
> Make sure you configure your serial port to the right
> speed/configuration using the "stty" program.

I'm still trying to figure how systemd configures the serial ports, but I can't seem to find out where it does anything at all to the serial ports?  Does anyone have any ideas where systemd would configure the serial ports?  The only thing I found is where it sets up the console, which is ttymxc0 in my case.  Other than that, I don't see where it configures the remaining serial ports.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com<http://free-electrons.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170224/0748f5d6/attachment.html>
