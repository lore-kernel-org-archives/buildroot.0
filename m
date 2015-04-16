From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:06:15 +0200
Subject: [Buildroot] [PATCH 01/15] configs/qemu: update aarch64 virt
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150416080615.5681c0f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 15 Apr 2015 14:04:58 -0300, Gustavo Zacarias wrote:
> Switch to kernel 4.0.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../qemu/aarch64-virt/{linux-3.19.config => linux-4.0.config}  |  0
>  board/qemu/aarch64-virt/readme.txt                             |  2 +-
>  configs/qemu_aarch64_virt_defconfig                            | 10 +++++-----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename board/qemu/aarch64-virt/{linux-3.19.config => linux-4.0.config} (100%)

Series applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
