From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:44:03 +0200
Subject: [Buildroot] [PATCH] imx-gpu-viv: install g2d library and header
In-Reply-To: <1444662194-17583-1-git-send-email-vincent.stehle@freescale.com>
References: <1444662194-17583-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20151012234403.0cecfa89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Mon, 12 Oct 2015 17:03:14 +0200, Vincent Stehl? wrote:
> Freescale gpu-viv binaries archive supplies the libraries and headers
> for accelerated OpenGL ES, OpenCL and OpenVG on i.MX6 platforms.
> 
> This binaries archive also supplies a g2d library and its header, which
> allow to perform accelerated 2D operations on i.MX6 platforms in a
> simpler manner. Install those as well, as it is useful for some
> packages, such as e.g. kodi.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>

I've applied Gary's patch instead:

   http://git.buildroot.net/buildroot/commit/?id=f640a6659f6c5f9c99684a98de006bbccfded128

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
