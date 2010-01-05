From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jan 2010 17:15:19 +0100
Subject: [Buildroot] What is "make BOARD=xyz getconfig" supposed to do?
In-Reply-To: <hhvngn$9lk$1@ger.gmane.org>
References: <hhvngn$9lk$1@ger.gmane.org>
Message-ID: <20100105171519.3ccab657@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 5 Jan 2010 15:57:11 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> The instructions on using buildroot for Atmel AT91 boards says
> to do this:
> 
>   make BOARD=AT91 getconfig
>   
> I can't find any mention of a "getconfig" target in the docs.
> Can somebody explain what it's supposed to do?

Nothing. This has been removed since 2009.11. See
http://git.buildroot.net/buildroot/commit/?id=18183726d4ab327b217a9ead3a8e88cb434257f6

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
