From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:56:25 +0200
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <e3405ae6-8f0b-0e40-e2e4-efafe77bf717@mind.be>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
 <20160701151804.61f389e9@free-electrons.com>
 <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
 <20160701161556.5e65b3df@free-electrons.com>
 <1533419985.7541395.1467386922132.JavaMail.zimbra@datacom.ind.br>
 <e3405ae6-8f0b-0e40-e2e4-efafe77bf717@mind.be>
Message-ID: <20160702125625.11882f51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Jul 2016 12:47:14 +0200, Arnout Vandecappelle wrote:

> > Because the value of HOSTCFLAGS set in U-Boot's config.mk is overwritten.   
> 
>  How about leaving HOSTCFLAGS alone, and instead setting
> HOSTCC="$(HOSTCC) $(HOST_CFLAGS)". HOSTLDFLAGS can probably be overridden.

Good point, that's possibly an alternate solution. I sent a patch
implementing a different solution, but Carlos, if you can try Arnout's
suggestion, it would be good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
