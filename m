From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 12:13:44 +0100
Subject: [Buildroot] [PATCH 1/3] configs/qemu: update arm-vexpress
 instructions for SMP
In-Reply-To: <1454888348-8149-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454888348-8149-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160208121344.7481b349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  7 Feb 2016 20:39:06 -0300, Gustavo Zacarias wrote:
> We can use the vexpress arm defconfig to test SMP features in Qemu.
> So document the necessary invocation changes to account for this, in
> preparation of the arm nuri defconfig removal.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/qemu/arm-vexpress/readme.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
