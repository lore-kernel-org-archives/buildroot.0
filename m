From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:29:47 +0200
Subject: [Buildroot] [PATCH 1/6] package/opengl/opencl: new virtual
 package
In-Reply-To: <20181020221437.12687-2-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
 <20181020221437.12687-2-thomas.petazzoni@bootlin.com>
Message-ID: <20181021162947.62a3c672@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 00:14:32 +0200, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/opengl/Config.in              | 1 +
>  package/opengl/libopencl/Config.in    | 6 ++++++
>  package/opengl/libopencl/libopencl.mk | 7 +++++++
>  3 files changed, 14 insertions(+)
>  create mode 100644 package/opengl/libopencl/Config.in
>  create mode 100644 package/opengl/libopencl/libopencl.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
