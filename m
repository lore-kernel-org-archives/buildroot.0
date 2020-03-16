From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2020 17:55:17 +0100
Subject: [Buildroot] [PATCH 1/4] package/bluez5_utils: bump to version
 5.54
In-Reply-To: <20200316164505.zvsutzatugff7ofh@sapphire.tkos.co.il>
References: <20200316164024.540598-1-joerg.krause@embedded.rocks>
 <20200316164505.zvsutzatugff7ofh@sapphire.tkos.co.il>
Message-ID: <6b80cfc97111d6cc13dd67483cda0fc90f774fed.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, 2020-03-16 at 18:45 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Mon, Mar 16, 2020 at 05:40:21PM +0100, J?rg Krause wrote:
> > Changes since version 5.52:
> > 

[snip]

> >  
> >  # Keep the version and patches in sync with bluez5_utils-headers
> > -BLUEZ5_UTILS_VERSION = 5.52
> > +BLUEZ5_UTILS_VERSION = 5.54
> 
> What about bluez5_utils-headers?

Thanks for the hint!

> baruch
> 
> >  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
> >  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> >  BLUEZ5_UTILS_INSTALL_STAGING = YES
