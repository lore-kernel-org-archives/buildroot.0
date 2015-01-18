From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jan 2015 17:38:35 +0100
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
 defconfig
In-Reply-To: <20150117223246.GH2827@tarshish>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
 <20150117223246.GH2827@tarshish>
Message-ID: <20150118173835.2bb56f26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 18 Jan 2015 00:32:46 +0200, Baruch Siach wrote:
> Hi Ivo,
> 
> On Sat, Jan 17, 2015 at 11:18:32PM +0100, Ivo Slanina wrote:
> > Added defconfig for UDOO Quad board. Used official kernel 3.0.35.
> > Kernel is patched in order to use gcc version 4.8 and above,
> > according to mailing list at
> > https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html
> 
> Why can't you use mainline kernel for this board?

Well, on i.MX6, as far as know, you can't get OpenGL support with a
mainline kernel. So even though I definitely support and encourage
people to use mainline kernels, I believe for Buildroot defconfigs, it
sometimes makes sense to use the vendor kernel when it is absolutely
necessary to enable certain important features, like 3D acceleration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
