From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 21 Apr 2015 17:04:37 +0000
Subject: [Buildroot] [PATCH v4] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <20150421162550.GS5428@tarshish>
References: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
 <1410155602.4784.1.camel@abrodkin-8560l.internal.synopsys.com>
 <1410787751.5875.30.camel@abrodkin-8560l.internal.synopsys.com>
 <1411470616.8968.3.camel@abrodkin-8560l.internal.synopsys.com>
 <20140923131924.2334adec@free-electrons.com>
 <1429623833.2624.15.camel@synopsys.com> <20150421162550.GS5428@tarshish>
Message-ID: <1429635877.7550.1.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, 2015-04-21 at 19:25 +0300, Baruch Siach wrote:
> Hi Alexey,
> 
> On Tue, Apr 21, 2015 at 01:43:53PM +0000, Alexey Brodkin wrote:
> > I just got a reminder on my pending patches in Buildroot so I'm updating
> > that one.
> > 
> > This v4 patch should be dropped because it is now superseded with v5
> > (http://patchwork.ozlabs.org/patch/453849/) which in its turn is just a
> > rebase of v4 on top of more up to date master.
> 
> Please mark this patch as "Superseded" in Buildroot's patchwork, then.

Already done. Made it before sending my previous email.

-Alexey
