From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 18:19:36 +0200
Subject: [Buildroot] [PATCH v3] board: Add support for Engicam i.CoreM6
 Quad/Dual boards
In-Reply-To: <CAD6G_RQ-ouaXSUkK-On+WkbmY2kVBz_EPXDfyZJTk6DGpB-Aew@mail.gmail.com>
References: <1491329412-5660-1-git-send-email-jagan@openedev.com>
 <20170404221750.41125e2e@free-electrons.com>
 <CAD6G_RQ-ouaXSUkK-On+WkbmY2kVBz_EPXDfyZJTk6DGpB-Aew@mail.gmail.com>
Message-ID: <20170405181936.109cf410@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Apr 2017 21:26:16 +0530, Jagan Teki wrote:

> > This script is exactly the same as the one in
> > board/freescale/common/imx/post-image.sh, I definitely would like to
> > avoid duplication.  
> 
> Same, but calling genimage.cfg is different in engicam vs freescale common.

What is different?

> > For now, if you're trying to submit the support for a single board, I
> > would suggest that you:
> >
> >  1. Use a "fixed" genimage.cfg, i.e without %FILES% or %DTBS%
> >
> >  2. Use support/scripts/genimage.sh  
> 
> I will submit remaining boards soon, so I will keep the genimage.cfg as it is.

What prevents you from using the Freescale common genimage.cfg?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
