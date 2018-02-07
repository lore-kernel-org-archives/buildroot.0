From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Feb 2018 13:36:30 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/gdb: bump to version 8.1
In-Reply-To: <20180207100213.GB2464@scaer>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-3-thomas.petazzoni@bootlin.com>
 <20180207100213.GB2464@scaer>
Message-ID: <20180207133630.6aec55a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Feb 2018 11:02:13 +0100, Yann E. MORIN wrote:

> > +config BR2_GDB_VERSION_8_1
> > +	bool "gdb 8.1.x"
> > +	# Needs a C++11 compiler
> > +	depends on BR2_HOST_GCC_AT_LEAST_4_8  
> 
> And there you would have added:
> 
>     select BR2_PACKAGE_GDB_NEEDS_CXX11

No: see my reply to PATCH 1/5 to explain why this doesn't work :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
