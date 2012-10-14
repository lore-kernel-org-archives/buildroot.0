From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 23:06:22 +0200
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
 <pkg>-extract
In-Reply-To: <507B27E5.8060004@mind.be>
References: <50768116.4000506@relinux.de>
 <1350225704-5693-1-git-send-email-arnout@mind.be>
 <20121014200139.525802ad@skate> <507B27E5.8060004@mind.be>
Message-ID: <20121014230622.44a6d420@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 14 Oct 2012 23:00:21 +0200, Arnout Vandecappelle wrote:

> > Otherwise, I'm fine with fixing this problem using this approach, looks
> > good to me.
> 
>   The reason that I choose to rename the -rsync target is that I'm hesitant
> to add more targets - they slow down make.
> 
>   However, this would only be for the OVERRIDE packages, so it just adds a few
> targets, not 1000.  So I'll take your suggestion and resend.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
