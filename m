From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 21:14:15 +0200
Subject: [Buildroot] [PATCHv3] udev: bump to 172
In-Reply-To: <20110718180753.35727036@skate> (Thomas Petazzoni's message of
 "Mon, 18 Jul 2011 18:07:53 +0200")
References: <4E1D4062.9010909@visionsystems.de>
 <87y5zz8jm6.fsf@macbook.be.48ers.dk> <20110716092425.02e80735@skate>
 <87oc0s6n6k.fsf@macbook.be.48ers.dk> <20110718180753.35727036@skate>
Message-ID: <87pql75rlk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> But it is as we build pkg-config with:
 >> 
 >> --with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"

 Thomas> It wasn't at the time I did my udev package (which I lost), and
 Thomas> maybe the same is true for Yegor's package. Yegor, can you
 Thomas> retry without this PKG_CONFIG_PATH variable ?

Please also take my other comments into considerations when respinning
the patch.

-- 
Bye, Peter Korsgaard
