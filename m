From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Wed, 8 Dec 2010 08:05:30 -0000
Subject: [Buildroot] Steps to add a new board
In-Reply-To: <20101207204426.08a6be76@surf>
References: <AB12B32E73474741A2C5361C433A44DE01E38E6B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<20101207204426.08a6be76@surf>
Message-ID: <AB12B32E73474741A2C5361C433A44DE026111AF@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

...
> Good idea, sorry for the huge delay for the answer :)
No problem, I noticed you were working in this area so I kept quiet.

...
> > I also use a post build script to fix securetty (the device needs
> > ttySC0)
> 
> Maybe this could be added in a generic way, i.e in the main securetty
> file.
Yes, that makes sense.

...
> > and also add an mdev script to /etc/init.d along with mdef.conf.
> 
> The boards-cleanup branch I'm pushing also carries some work from Yegor
> that better integrates mdev (there's just a Buildroot option to
> enable). However, it does not come with a mdev configuration file.
Ok, if I want BR to add this to my rootfs I will still need a post build
script.
 
...
> All of those changes are still pending review and inclusion, though.
Sure, I'll wait for these before sending any board patches.

Thanks
Phil
