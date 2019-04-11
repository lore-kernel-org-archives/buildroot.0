From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:24:47 +0200
Subject: [Buildroot] [PATCH v3 1/2] support/testing: add xserver + Mesa
 OpenGL (GLX) + glxinfo
In-Reply-To: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
References: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
Message-ID: <20190411182447.4c1f8570@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Apr 2019 17:58:04 +0200
Youssef at smile.fr, Harmouch at smile.fr, youssef.harmouch at smile.fr wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> This test allow to check if the xserver with GLX is working properly.
> This is a basic test but it allow to trigger the current bug reported
> by [1].
> 
> To test if the glxinfo test is working, you can change "-display :0" by
> "-display :1" in the glxinfo command line.
> 
> [1] https://bugs.buildroot.org/show_bug.cgi?id=11591
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: youssef <youssef.harmouch@smile.fr>
> index 0000000000..5a28411f49

The patch was somehow damaged here, so I fixed it up, squashed PATCH
2/2 into this one, and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
