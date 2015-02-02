From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 18:38:23 +0100
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
	defconfig
In-Reply-To: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <CAAXf6LV9eBpEayQfEjs9b6xOrfweJE7VWTJnonAhgR5xyWsh2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivo,

On Sat, Jan 17, 2015 at 11:18 PM, Ivo Slanina <ivo.slanina@gmail.com> wrote:
> Added defconfig for UDOO Quad board. Used official kernel 3.0.35.
> Kernel is patched in order to use gcc version 4.8 and above,
> according to mailing list at
> https://lists.yoctoproject.org/pipermail/meta-freescale/2013-July/003531.html
>
> Bootloader is also downloaded from official repository.
>
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
> ---
>  configs/udoo_quad_defconfig |   25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 configs/udoo_quad_defconfig

Thanks for your contribution!
I resubmitted your patch with two minor changes: use explicit commit
numbers instead of a branch name like 'master'.

Best regards,
Thomas
