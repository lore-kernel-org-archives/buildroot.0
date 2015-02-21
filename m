From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:30:45 +0100
Subject: [Buildroot] [PATCH 07/10 v7] package/nvidia-driver: build the
 kernel module
In-Reply-To: <c088165a092073307c54f1a9fa650c9180793063.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <c088165a092073307c54f1a9fa650c9180793063.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150221233045.56994a0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 10 Feb 2015 21:01:14 +0100, Yann E. MORIN wrote:
> Add option to build the nvidia.ko module. If CUDA is enabled on x86_64,
> also build the nvidia-uvm.ko kernel module (for Unified Memory access),
> which is required by the CUDA user-land library.
> 
> Substancially inspired by the corresponding Gentoo ebuild:
>     http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-drivers/nvidia-drivers/nvidia-drivers-340.32.ebuild?revision=1.2&view=markup
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied to next, after doing some minor changes:

    [Thomas:
      - add quotes when using $(TARGET_CC) and other variables, since they
        can have spaces in their values
      - remove space after opening parenthesis and before closing parenthesis.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
