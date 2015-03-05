From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 23:27:08 +0100
Subject: [Buildroot] [PATCH v1] directfb: fix imlib image provider
In-Reply-To: <1425593249-20516-1-git-send-email-ps.report@gmx.net>
References: <1425593249-20516-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150305232708.2c4edce3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu,  5 Mar 2015 23:07:29 +0100, Peter Seiderer wrote:
> Change 0002-imlib2-config.patch to patch configure.in instead of
> configure to survicve the autoreconf step introduced by [1].
> 
> Fixes the following runtime error, e.g. from df_texture:
> 
> (!) Direct/Interface: Unable to dlopen `/usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_imlib2.so'!
>     --> /usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_imlib2.so: undefined symbol: imlib_image_get_width
> 
> [1] http://git.buildroot.net/buildroot/commit/?id=7e9264956bb5693bc49274ee0b42ffb4c869e23f
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
