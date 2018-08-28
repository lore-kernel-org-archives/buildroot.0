From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 21:57:14 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
 <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
 <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
Message-ID: <20180828215714.5e2c7c84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 19:26:53 +0200, Giulio Benetti wrote:

> If this makes sense I can resend this patch using the patch you've 
> pointed me to.

Yes, if there is already the same patch committed upstream, we want to
backport the upstream patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
