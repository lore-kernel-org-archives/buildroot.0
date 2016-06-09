From: Andrew Webster <Awebster@arcx.com>
Date: Thu, 9 Jun 2016 21:18:18 +0000
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.4
In-Reply-To: <CAAMH-ysUdKhcab9-F6CjhYJQVFsq__jQ__pOQUU7+Hf03ipofg@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <642a0f54088507a92effa0f935950326f752d0c8.1464958470.git.awebster@arcx.com>
 <CAAMH-ysqVQDCw1_OmC79tqOEKrTftaOJk=0gNrW7-j3fNMHURQ@mail.gmail.com>
 <282d0384157042e28d80a63646119b3b@WEBMAIL.arcx.com>
 <CAAMH-ysUdKhcab9-F6CjhYJQVFsq__jQ__pOQUU7+Hf03ipofg@mail.gmail.com>
Message-ID: <f591ff346077434c852150ce14b43300@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

> From: Gary Bisson [mailto:gary.bisson at boundarydevices.com]
> Sent: Tuesday, June 07, 2016 3:37 AM

> >> > This patch is based on the Yocto equivalent:
> >> > https://github.com/Freescale/meta-fsl-arm/commit/dbb8773
> >>
> >> Please share how you've tested the VPU firmware for instance.
> >
> > I followed the same tests from your previous version bumps (e.g. gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm
> ! matroskademux ! imxvpudec ! imxipuvideosink).  I can add the test(s) performed to the commit messages if you like.
> 
> Yes please, at least in the cover letter so anyone knows how to make sure the package actually works.
> 

Given that the gstreamer-0.10 plugins from NXP are no longer being updated, and don't seem to work with the new packages (or maybe I didn't configure things properly), do you know of another way to test the imx-codec, imx-parser, and imx-vpuwrap packages?

Andrew
