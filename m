From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 20:55:02 +0200
Subject: [Buildroot] [PATCH] qemu-xtensa: Update to latest stable kernel
In-Reply-To: <20141003154248.GA2813@waldemar-brodkorb.de>
References: <20141003154248.GA2813@waldemar-brodkorb.de>
Message-ID: <20141003205502.7e3a493f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 3 Oct 2014 17:42:48 +0200, Waldemar Brodkorb wrote:
> Update to Linux 3.16.3.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../qemu/xtensa-lx60/{linux-3.15.config => linux-3.16.config}  |    0
>  board/qemu/xtensa-lx60/readme.txt                              |    2 +-
>  configs/qemu_xtensa_lx60_defconfig                             |    8 ++++----
>  3 files changed, 5 insertions(+), 5 deletions(-)
>  rename board/qemu/xtensa-lx60/{linux-3.15.config => linux-3.16.config} (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
