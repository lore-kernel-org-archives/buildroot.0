From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jun 2020 14:10:42 +0200
Subject: [Buildroot] [PATCH v2 3/7] package/cups: bump to version 2.3.3
In-Reply-To: <CA+TH9VmLyk-z85zMi75mry9Fx9QSUxC9PPKndKnwiXTL-rh6CA@mail.gmail.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-4-angelo@amarulasolutions.com>
 <20200620223540.3ccb6371@windsurf.home>
 <CA+_SqVa8bHa4+FZ_NjE4Gw-V1SAGNrSE_AX=fzX=eH07R=wxnA@mail.gmail.com>
 <20200620225516.59ac83ee@windsurf.home>
 <CA+TH9VmLyk-z85zMi75mry9Fx9QSUxC9PPKndKnwiXTL-rh6CA@mail.gmail.com>
Message-ID: <20200621141042.13fcf5d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Jun 2020 23:53:12 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> > How is this related to the bump? Is it the version bump that adds the
> > service file? Or did it already exist before the bump?
> 
> Cups is a service and a service without an init script is useless.

Absolutely, and this is already true today, independently from your
version bump.

> So, to have the new version working it needs the rcdir change and the
> systemv script. Systemd script is instead fine.

But I guess this is also true not just for the "new version", but also
for the "current version".

> If you are asking me to even fix the older version I can do that, but I'm
> doing a bump and fixing at the same time because either the bump will not
> work.

The two things are independent, they should be addressed separately.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
