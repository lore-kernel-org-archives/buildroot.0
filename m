From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 09:26:39 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-perl: add patch_subdir_makefile
 function
In-Reply-To: <20181013141201.4234-1-francois.perrad@gadz.org>
References: <20181013141201.4234-1-francois.perrad@gadz.org>
Message-ID: <20181014092639.46392df6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Oct 2018 16:12:00 +0200, Francois Perrad wrote:
> based on an initial work of Christopher McCrory <chrismcc@gmail.com>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for working on this. In the review of
https://patchwork.ozlabs.org/patch/959634/, I was asking:

"""
This problem was reported at
https://rt.cpan.org/Public/Bug/Display.html?id=28632, and apparently
fixed in 2013, at least for the "LD" variable. Why are we still seeing
this issue ?
"""

Any idea ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
