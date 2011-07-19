From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 19 Jul 2011 08:47:10 +0200
Subject: [Buildroot] [PATCHv3] udev: bump to 172
In-Reply-To: <20110718180753.35727036@skate>
References: <4E1D4062.9010909@visionsystems.de>
 <87y5zz8jm6.fsf@macbook.be.48ers.dk> <20110716092425.02e80735@skate>
 <87oc0s6n6k.fsf@macbook.be.48ers.dk> <20110718180753.35727036@skate>
Message-ID: <4E25286E.7050202@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.07.2011 18:07, schrieb Thomas Petazzoni:
> Le Mon, 18 Jul 2011 09:52:03 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
> 
>> But it is as we build pkg-config with:
>>
>> --with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"
> 
> It wasn't at the time I did my udev package (which I lost), and maybe
> the same is true for Yegor's package. Yegor, can you retry without this
> PKG_CONFIG_PATH variable ?

Yes, I could compile without this variable.

Yegor
