From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:09:03 +0100
Subject: [Buildroot] [PATCH 0/6] OpenCL support
In-Reply-To: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181203230903.3f0d7a19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 00:14:31 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (4):
>   package/opengl/opencl: new virtual package
>   package/mesa3d-headers: install OpenCL headers when needed
>   package/nvidia-driver: use += where appropriate
>   package/nvidia-driver: become an OpenCL provider
> 
> Valentin Korenblit (2):
>   package/mesa3d: enable OpenCL support
>   package/clinfo: new package

I've applied patches 2-6 in this series, since PATCH 1/6 was already
applied since a long time, and no further comments were received.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
