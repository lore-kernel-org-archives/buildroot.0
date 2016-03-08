From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 08 Mar 2016 12:13:30 +0100
Subject: [Buildroot] Analysis of build results for 2016-03-07
In-Reply-To: <20160308112522.47fc4935@free-electrons.com>
References: <20160308073022.EFA101019EE@stock.ovh.net>
 <20160308112522.47fc4935@free-electrons.com>
Message-ID: <1457435610.6335.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2016-03-08 at 11:25 +0100, Thomas Petazzoni wrote:
> Hello all,

> 
> > 
> > ?????????arm |????????????????????hostapd-2.5 | NOK | http://autobu
> > ild.buildroot.net/results/c265cfada20621a631e9d118b9633df80b0e4864/
> > ?????????arm |????????????????????hostapd-2.5 | NOK | http://autobu
> > ild.buildroot.net/results/658c5e2fe6e3a4ad74ca47c926426e95eac0b9ec/
> Musl issue. Anybody to look into
> http://git.alpinelinux.org/cgit/aports/tree/main/hostapd, clean up
> the
> patches, submit upstream and to Buildroot?

I've sent a patch upstream to fix the __caddr_t issue [1]. I'll prepare
a patch for Buildroot, too.

[1]?http://lists.infradead.org/pipermail/hostap/2016-March/035350.html
