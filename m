From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 15 May 2016 20:21:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <1463336508.2110.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sa, 2016-05-14 at 15:46 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> J?r?me, Gustavo, Bernd, Fabio, Gwenhael, Romain, Vicente, Yann, Matt,
> Martin, Baruch, Samuel, Waldemar, Peter, please see below, there's
> some
> good stuff for you :-) Thanks!
> 
> On Sat, 14 May 2016 08:30:24 +0200 (CEST), Thomas Petazzoni wrote:
> 
> 
> > ??????x86_64 |??????????????ipsec-tools-0.8.2 | NOK | http://autobu
> > ild.buildroot.net/results/0232ff61000fe8936bd768ae49dd75e1bad36094/
> 
> Musl build issue. Gustavo, you are the person doing most of the
> changes
> on ipsec-tools. Could you have a look?

I already proposed a series of patches to fix musl build for ipsec-
tools on upstream [1] and Buildroot [2]. I'll update the fixes soon.

[1]?https://sourceforge.net/p/ipsec-tools/mailman/message/35071943/
[2]?http://patchwork.ozlabs.org/patch/619641/

Best regards
J?rg Krause
