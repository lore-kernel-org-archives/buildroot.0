From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Jan 2018 09:16:09 +0000
Subject: [Buildroot] [PATCH v2] binutils: Allow upstream 2.29 to be
 chosen for ARC
In-Reply-To: <20180117082557.17026-1-abrodkin@synopsys.com>
References: <20180117082557.17026-1-abrodkin@synopsys.com>
Message-ID: <1516180569.3547.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi gents,

Please disregard this one.
Looks like I need more morning coffee as this was already applied
a couple of months ago but I was looking at a local tree with 2017.11.x checked-out.

So really sorry for the noise!

-Alexey 

On Wed, 2018-01-17 at 11:25 +0300, Alexey Brodkin wrote:
> From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> 
> As of today quite a lot of ARC stuff got merged in upsream
> such that we may finally use upstream realease for building
> and even running Linux kernel and rootfs built with vanilla
> binutils.
> 
> Essentially upstream release is still a bit behind our
> GitHub-based releases but let's try to use vanilla version
> and if we're lucky enough with just a small set of back-ported patches
> we'll be able to use vanilla release(s) for everything in Buildroot.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
