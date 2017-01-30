From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 30 Jan 2017 20:55:56 +0100
Subject: [Buildroot] [PATCH] package/mpd: disable on SPARCV8, NIOS2,
 ARMV{4, 5}
In-Reply-To: <20170130104952.409eb0d9@free-electrons.com>
References: <20170121161100.3142-1-joerg.krause@embedded.rocks>
 <20170122172600.333588cf@free-electrons.com>
 <1485080385.6667.1.camel@embedded.rocks>
 <20170130104952.409eb0d9@free-electrons.com>
Message-ID: <1485806156.3759.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2017-01-30 at 10:49 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 22 Jan 2017 11:19:45 +0100, J?rg Krause wrote:
> 
> > > The reason I'm asking is because I believe a
> > > BR2_TOOLCHAIN_HAS_GCC_BUG_xyz hidden option would be a bit
> > > better:
> > > 
> > > ?1. It would document what this is for
> > > 
> > > ?2. It would avoid repeating the architecture conditions??
> > 
> > Yes, this would be better in case more packages show up. Shall I
> > make
> > an updated fix?
> 
> Yes, please :)

OK.

I'm a little upset that there will be no MPD available for the ARMv5
architecture until GCC 7 is available?in Buildroot. Maybe we can still
support the 0.19 branch for the archs which are affected by the GCC
issue and use the 0.20 otherwise? Any objections?

J?rg
