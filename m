From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2017 10:49:52 +0100
Subject: [Buildroot] [PATCH] package/mpd: disable on SPARCV8, NIOS2,
 ARMV{4, 5}
In-Reply-To: <1485080385.6667.1.camel@embedded.rocks>
References: <20170121161100.3142-1-joerg.krause@embedded.rocks>
 <20170122172600.333588cf@free-electrons.com>
 <1485080385.6667.1.camel@embedded.rocks>
Message-ID: <20170130104952.409eb0d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 11:19:45 +0100, J?rg Krause wrote:

> > The reason I'm asking is because I believe a
> > BR2_TOOLCHAIN_HAS_GCC_BUG_xyz hidden option would be a bit better:
> > 
> > ?1. It would document what this is for
> > 
> > ?2. It would avoid repeating the architecture conditions  
> 
> Yes, this would be better in case more packages show up. Shall I make
> an updated fix?

Yes, please :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
