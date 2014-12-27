From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:12:30 +0100
Subject: [Buildroot] [PATCH 1/4] libxkbcommon: bump to version 0.5.0
In-Reply-To: <20141227154956.GD4098@free.fr>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
 <20141227101335.GA4098@free.fr> <20141227154956.GD4098@free.fr>
Message-ID: <20141227171230.6f1e679a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 27 Dec 2014 16:49:56 +0100, Yann E. MORIN wrote:

> > I guess what we want is to use --disable-x11 when we do not have x11
> > enabled, and if it is enabled, select the required package(s).
> 
> I've had a bit of bandwidth today, and I've had a look at it, and the
> fix is almost ready. I'll submit soon.

Great thanks. Since the issue is causing a good number of failures,
it's nice to have a fix quickly. I was even considering reverting the
change, actually. But I'll wait for your fix instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
