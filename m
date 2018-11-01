From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:39:18 +0100
Subject: [Buildroot] [PATCH v6 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
References: <20181026130358.11776-1-jagan@amarulasolutions.com>
 <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
Message-ID: <20181101133918.43f30a1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Nov 2018 12:59:22 +0100, Arnout Vandecappelle wrote:

>  Also it isn't clear to me why the extlinux.conf is needed when we're actually
> using U-Boot, but I guess there must be a reason for it :-)

Yes, that's one of the way U-Boot can now be told how to boot. See
http://git.denx.de/?p=u-boot.git;a=blob;f=doc/README.distro;h=f8e9752a0fa4244ef0a6f7ee530b0aa218080cac;hb=HEAD.

Basically, the idea is that U-Boot simply looks at extlinux.conf in
various well-defined locations in the root filesystem, and this allows
the operating system installed to tell U-Boot how it should be booted.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
