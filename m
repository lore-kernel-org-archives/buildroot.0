From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 30 Apr 2019 13:46:52 -0700
Subject: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_*: kernel build
 needs mkimage
In-Reply-To: <20190430203734.27376-1-yann.morin.1998@free.fr>
References: <20190430203734.27376-1-yann.morin.1998@free.fr>
Message-ID: <CAMo8BfLHZ3ZSWn6Ez3RGubQefnRFJaxBvDoKfdSMi37YufRbiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 30, 2019 at 1:37 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Following ffbe46a5295 ("linux: simplify LINUX_BUILD_CMDS"), the Linux
> kernel build for these xtensa qemu builds an image format that needs
> mkimage.
>
> Reported-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  configs/qemu_xtensa_lx60_defconfig       | 3 +++
>  configs/qemu_xtensa_lx60_nommu_defconfig | 3 +++
>  2 files changed, 6 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
