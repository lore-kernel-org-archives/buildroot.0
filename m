From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 6 Jan 2017 11:52:49 -0800
Subject: [Buildroot] [PATCH 0/2] add custom xtensa core support to linux
	and U-Boot
In-Reply-To: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
References: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <CAMo8Bf+M13uuV-nbCCnXuvqzY8q6TDN58eX=sDmD-FTbJx5vsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

On Sun, Dec 25, 2016 at 5:50 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Hello,
>
> this series adds xtensa configuration overlay extraction to the prepatch
> step of linux and U-Boot build. That allows building linux and U-Boot for
> custom xtensa cores as a part of a buildroot build.
>
> Max Filippov (2):
>   linux: add xtensa overlay unpacking to prepatch step
>   uboot: add xtensa overlay unpacking to prepatch step
>
>  boot/uboot/uboot.mk | 10 ++++++++++
>  linux/linux.mk      | 10 ++++++++++
>  2 files changed, 20 insertions(+)

-- 
Thanks.
-- Max
