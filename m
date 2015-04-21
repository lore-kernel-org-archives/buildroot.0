From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 21 Apr 2015 13:43:53 +0000
Subject: [Buildroot] [PATCH v4] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <20140923131924.2334adec@free-electrons.com>
References: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
 <1410155602.4784.1.camel@abrodkin-8560l.internal.synopsys.com>
 <1410787751.5875.30.camel@abrodkin-8560l.internal.synopsys.com>
 <1411470616.8968.3.camel@abrodkin-8560l.internal.synopsys.com>
 <20140923131924.2334adec@free-electrons.com>
Message-ID: <1429623833.2624.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-09-23 at 13:19 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 23 Sep 2014 11:10:16 +0000, Alexey Brodkin wrote:
> 
> > > > I'm wondering if this version is fine and we may go ahead an apply it?
> > > 
> > > Please treat this as a polite reminder about this pending patch.
> > 
> > Any chance for this change to made its way into upstream Buildroot?
> 
> Yes. Please give us some time to test it before applying it. It's
> touching a fairly sensitive area, so we don't apply such patches
> lightly.
> 
> Best regards,
> 
> Thomas

I just got a reminder on my pending patches in Buildroot so I'm updating
that one.

This v4 patch should be dropped because it is now superseded with v5
(http://patchwork.ozlabs.org/patch/453849/) which in its turn is just a
rebase of v4 on top of more up to date master.

-Alexey
