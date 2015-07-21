From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:26:12 +0200
Subject: [Buildroot] [PATCH 4/4] cubieboard: [PATCH] ipconfig: add
 nameserver IPs to kernel-parameter ip=
In-Reply-To: <1437443362-8025-4-git-send-email-fancp2007@gmail.com>
References: <1437443362-8025-3-git-send-email-fancp2007@gmail.com>
 <1437443362-8025-4-git-send-email-fancp2007@gmail.com>
Message-ID: <20150721232612.6af50062@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Tue, 21 Jul 2015 09:49:22 +0800, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  .../5e953778a2aab04929a5e7b69f53dc26e39b079e.patch | 133 +++++++++++++++++++++
>  configs/cubieboard2_defconfig                      |   1 +
>  configs/cubieboard_defconfig                       |   1 +
>  configs/cubietruck_defconfig                       |   1 +
>  4 files changed, 136 insertions(+)
>  create mode 100644 board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch

Thanks for the patch, but unfortunately, it's not acceptable. It's
clearly a feature patch for the kernel, and we generally don't accept
feature patches in Buildroot. If you want to be able to set the
nameserver from the ip= parameter, then please submit a patch to the
Linux kernel network maintainers and get it accepted. We don't want to
carry such patches forever in the Buildroot tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
