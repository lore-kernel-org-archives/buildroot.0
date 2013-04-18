From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Apr 2013 09:25:23 +0200
Subject: [Buildroot] [PATCH v5 1/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <516ED0F0.6070804@mind.be>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <20130416205103.6ecd9bd9@skate> <516ED0F0.6070804@mind.be>
Message-ID: <20130418092523.4aeb6734@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 17 Apr 2013 18:42:24 +0200, Arnout Vandecappelle wrote:

> > I do agree with Arnout on one point here: we can hide this choice
> > when !BR2_bfin. However, contrary to Arnout, I'd like to keep this
> > BR2_BINFMT_ELF choice as an invisible option, that is always selected
> > on !BR2_bfin. Yes it's useless, but I think it makes the binfmt options
> > clearer.
> 
>   OK for me. Most important is that the choice is hidden when empty.

Agreed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
