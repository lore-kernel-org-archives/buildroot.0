From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 23:29:36 +0100
Subject: [Buildroot] [PATCH 10/16] arch/arm: add support for hard-float
 on Cortex-M4
In-Reply-To: <56EC7770.2080508@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F00F.9040209@mind.be>
 <20160317091624.157165ef@free-electrons.com>
 <56EC7770.2080508@mind.be>
Message-ID: <20160318232936.139e1c27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 22:47:28 +0100, Arnout Vandecappelle wrote:

> > Depending on the answer from the STM32 kernel maintainer, I will either
> > drop or keep (disabled in some form?) this floating point support.
> 
>   It's also an option to just keep it lingering in patchwork for a while.

I got some feedback from the STM32 kernel maintainer, and he doesn't
intend to work on FPU support anytime soon. So I've dropped the patch
for now.

I don't like to let things linger in patchwork. We already have enough
stuff there. If one day we want to re-add EABIhf support for Cortex-M,
my patch will be in the archives (and the patch is anyway simple enough
that anyone can re-create without much effort).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
