From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 21:58:33 +0200
Subject: [Buildroot] [PATCH v5 4/7] package/amd-catalyst: Add AMD
 proprietary graphic stack support
In-Reply-To: <20160823121950.16826-5-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-5-romain.perier@free-electrons.com>
Message-ID: <20160823215833.513e4a10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 14:19:47 +0200, Romain Perier wrote:
> This commits adds support for the AMD Catalyst Linux driver 15.9
> (15.201.1151). It includes the fglrx kernel module with various fixes
> to make it work with at least Linux kernel 4.4 LTS, the userspace OpenGL
> stack and the xorg driver module.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---

Applied to next, after taking into account the comments from Yann:

    [Thomas:
     - fixup whitespace issues noticed by Yann.
     - register AMD_CATALYST_PREPARE_MODULE as a post-patch hook rather than
       calling it during the configure step, also suggested by Yann.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
