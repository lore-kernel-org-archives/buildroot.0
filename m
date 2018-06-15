From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Jun 2018 23:23:02 +0200
Subject: [Buildroot] [git commit] modem-manager: update package prompt
 name
In-Reply-To: <20180615223316.6279b32a@windsurf>
References: <20180615193133.77D7188705@busybox.osuosl.org>
 <20180615193753.GB27644@x230> <20180615223316.6279b32a@windsurf>
Message-ID: <20180615212301.GA19969@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> On Fri, 15 Jun 2018 21:37:54 +0200, Petr Vorel wrote:

> > > diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> > > index 226f82f4f6..c4c723776d 100644
> > > --- a/package/modem-manager/Config.in
> > > +++ b/package/modem-manager/Config.in
> > > @@ -1,5 +1,5 @@
> > >  config BR2_PACKAGE_MODEM_MANAGER
> > > -	bool "modemmanager"
> > > +	bool "modem-manager"  
> > Sorry I should have thought twice before acking this.
> > It's not that important, but better would be to call it ModemManager, as that's its name.
> > And network-manager (called now networkmanager) as NetworkManager...

> We normally try to be consistent between the package/<pkg>/
> directory name and the prompt used in menuconfig.
Thanks for explaining Thomas.
So, I've sent a patch to fix the same issue with network-manager.


Kind regards,
Petr
