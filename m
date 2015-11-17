From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:22:46 +0100
Subject: [Buildroot] [PATCH 1/3] configs/qemu: bump x86 to 4.3 kernel
In-Reply-To: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151117212246.2115e657@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Nov 2015 13:37:12 -0300, Gustavo Zacarias wrote:
> Now that uclibc-ng was bumped to version 1.0.9 nothing prevents x86
> from working correctly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/qemu/x86/{linux-4.2.config => linux-4.3.config} |  0
>  configs/qemu_x86_defconfig                            | 10 +++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename board/qemu/x86/{linux-4.2.config => linux-4.3.config} (100%)

All three patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
