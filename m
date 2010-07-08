From: Ossy <ossy1980@gmx.net>
Date: Thu, 08 Jul 2010 22:18:44 +0200
Subject: [Buildroot] Mgetty in Buildroot config?
In-Reply-To: <4C34816B.6010606@terawatt.fr>
References: <4C34816B.6010606@terawatt.fr>
Message-ID: <4C3632A4.9080608@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 15:30, schrieb Damien Borie:
> Hello everybody!
>
> I have a little problem : I'm trying to install mgetty in my
> distribution, because I must use a serial modem. But I don't find mgetty
> option in config file and in buildroot menuconfig. I'm a bit surprises
> because I thought it was a common software. So I wonder if I'm just
> blind not to find it, or if mgetty isn't include in Buildroot for now.
> In this case, is there any patch to add it, or must I compile it myself ?
> I see in the mailing list archive that some thread talk about mgetty, so
> I concluded that it's possible to add it...
>
Hi Damien,

I think busybox provides a leightweight getty applet. Maybe it is 
sufficient for your needs.

Regards,
Marcus
