From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 18:25:59 +0100
Subject: [Buildroot] [PATCH 1/1] configs: csky_gx6605s need copy gdbinit
In-Reply-To: <1490259435-16719-1-git-send-email-ren_guo@c-sky.com>
References: <1490259435-16719-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170323182559.37d90691@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 16:57:15 +0800, Guo Ren wrote:
> gdbinit need load gx6605s.dtb, so we copy the gdbinit
> to the output/images and run the gdb in it.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  board/csky/gx6605s/post-image.sh | 5 +++++
>  board/csky/readme.txt            | 6 ++++--
>  configs/csky_gx6605s_defconfig   | 1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100755 board/csky/gx6605s/post-image.sh

Not applied, as I've applied your latest version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
