From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Jun 2018 21:44:16 +0200
Subject: [Buildroot] [git commit] modem-manager: update package prompt
 name
In-Reply-To: <20180615193753.GB27644@x230>
References: <20180615193133.77D7188705@busybox.osuosl.org>
 <20180615193753.GB27644@x230>
Message-ID: <20180615194415.GC27644@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Thomas,

> > commit: https://git.buildroot.net/buildroot/commit/?id=de46ba290d2152261e29ef5339d8ea4adbbaf132
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> > Rename the prompt string for consistency with the package directory
> > name.

> >  config BR2_PACKAGE_MODEM_MANAGER
> > -	bool "modemmanager"
> > +	bool "modem-manager"
> Sorry I should have thought twice before acking this.
> It's not that important, but better would be to call it ModemManager, as that's its name.
> And network-manager (called now networkmanager) as NetworkManager...
OK, bool is supposed to be lower case, than it's ok. although it looks a bit
unusual. Maybe I'm too used to Debian package names (modemmanager vs. network-manager).


Kind regards,
Petr
