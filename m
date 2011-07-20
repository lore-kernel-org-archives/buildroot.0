From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 18:19:55 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
Message-ID: <20110720181955.36911f14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 17:42:52 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> A while ago, there were some changes in the ccache handling, with
> which the cache location also changed to $(HOME)/.buildroot-ccache.
> Before that, the cache directory was configurable in .config. What is
> the reason of changing the cache location?

Simplifying the ccache support, mainly.

> In my (corporate) environment, the home directories are actually on
> the network (NFS) which is not ideal for performance. I would like to
> configure another cache directory.
> 
> Would you accept a patch that re-introduces BR2_CCACHE_DIR ?

I guess your use case is valid, so I would personally accept such a
patch. I don't like cluttering the "Build options" menu with too many
options, but I guess this option is a valid thing to have when ccache
support is enabled.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
