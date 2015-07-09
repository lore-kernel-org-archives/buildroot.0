From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:22:24 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/configs: enable DRM+QXL for x86
 and x86_64
In-Reply-To: <1436403244-1367-2-git-send-email-gustavo@zacarias.com.ar>
References: <1436403244-1367-1-git-send-email-gustavo@zacarias.com.ar>
 <1436403244-1367-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150709222224.529fbd35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Jul 2015 21:54:04 -0300, Gustavo Zacarias wrote:
> Allows for nicer framebuffer emulation under Qemu with the QXL xorg
> driver.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/qemu/x86/linux-4.1.config    | 2 ++
>  board/qemu/x86_64/linux-4.1.config | 2 ++
>  2 files changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
