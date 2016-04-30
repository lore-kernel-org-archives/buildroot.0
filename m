From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 15:28:04 +0200
Subject: [Buildroot] [PATCH 1/3] qemu/x86: use symlinked kernel config
In-Reply-To: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160430152804.0256a4ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 14:38:24 -0300, Gustavo Zacarias wrote:
> It's exactly the same as the x86_64 variant so just create a symlink.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/qemu/x86/linux-4.5.config | 32 +-------------------------------
>  1 file changed, 1 insertion(+), 31 deletions(-)
>  mode change 100644 => 120000 board/qemu/x86/linux-4.5.config

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
