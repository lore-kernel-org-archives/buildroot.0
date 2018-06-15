From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 22:33:16 +0200
Subject: [Buildroot] [git commit] modem-manager: update package prompt
 name
In-Reply-To: <20180615193753.GB27644@x230>
References: <20180615193133.77D7188705@busybox.osuosl.org>
 <20180615193753.GB27644@x230>
Message-ID: <20180615223316.6279b32a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jun 2018 21:37:54 +0200, Petr Vorel wrote:

> > diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> > index 226f82f4f6..c4c723776d 100644
> > --- a/package/modem-manager/Config.in
> > +++ b/package/modem-manager/Config.in
> > @@ -1,5 +1,5 @@
> >  config BR2_PACKAGE_MODEM_MANAGER
> > -	bool "modemmanager"
> > +	bool "modem-manager"  
> Sorry I should have thought twice before acking this.
> It's not that important, but better would be to call it ModemManager, as that's its name.
> And network-manager (called now networkmanager) as NetworkManager...

We normally try to be consistent between the package/<pkg>/
directory name and the prompt used in menuconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
