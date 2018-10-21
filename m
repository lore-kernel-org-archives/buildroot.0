From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 13:10:58 +0200
Subject: [Buildroot] [PATCH 2/6] package/mesa3d: enable OpenCL support
In-Reply-To: <4f7be120-98ed-8c1c-3f01-fb35dbad27cb@gmail.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
 <20181020221437.12687-3-thomas.petazzoni@bootlin.com>
 <4f7be120-98ed-8c1c-3f01-fb35dbad27cb@gmail.com>
Message-ID: <20181021131058.56711035@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 12:53:45 +0200, Valentin Korenblit wrote:

> > +LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
> > +will look for OpenCL "headers" on the target, when building the OpenCL
> > +kernels.  
> 
> Maybe it is clearer to write "OpenCL library headers", so we don't get confused
> with Khronos OpenCL-Headers.

I understand the confusion, but "OpenCL library headers" actually make
me think about the Khronos headers, i.e the headers that describe the
API of the OpenCL.so library.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
