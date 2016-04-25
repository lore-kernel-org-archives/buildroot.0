From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Mon, 25 Apr 2016 09:44:09 -0400
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for TS-4800
In-Reply-To: <20160424235938.78800305@free-electrons.com>
References: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1461255673-11443-3-git-send-email-damien.riegel@savoirfairelinux.com>
 <20160424235938.78800305@free-electrons.com>
Message-ID: <20160425134409.GA7387@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 24, 2016 at 11:59:38PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 21 Apr 2016 12:21:13 -0400, Damien Riegel wrote:
> > This patch adds support for the TS-4800 SoM manufactured by Technologic
> > Systems based on the Freescale i.MX515 SoC.
> >  ...
> I think you said on IRC you would post a new version of this patch, so
> I've marked this first version as "Changes Requested" in our patch
> tracking system. So don't forget to send a new version, otherwise we'll
> forget about it!

You're right, I asked you to delay the integration of this patch because
I got early feedbacks on IRC about one of the U-Boot patches (I was
messing with CONDIG_LOADADDR and that was just wrong). I'll send the v2
in a few minutes!

Thank you,
Damien
