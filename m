From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 7 Nov 2016 12:28:55 +0100
Subject: [Buildroot] Armadeus defconfigs failing to build
In-Reply-To: <20161104211033.4caca063@free-electrons.com>
References: <20161104211033.4caca063@free-electrons.com>
Message-ID: <b2217b15-6b57-0918-4590-5ee04049bfdf@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 04/11/2016 21:10, Thomas Petazzoni wrote:
> Hello Julien,
>
> I would like to let you know that several Armadeus defconfigs in
> Buildroot are failing to build:
>
>  - armadeus_apf51_defconfig fails to build because the Linux version is
>    too old to be built with gcc 5.x, which is now the default in
>    Buildroot. Could you update the defconfig to use a newer Linux
>    version, and check that U-Boot also builds fine?
>
>    See the complete build log at
>    http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf51_defconfig.log.FAIL
>
>  - armadeus_apf9328_defconfig fails to build in Linux, with some weird
>    "error: redefinition of 'return_address'" issue. Could you have a
>    look at this problem ? It might be due to the use of gcc 5.x, or
>    could be something else.
>
>    See the complete build log at
>    http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf9328_defconfig.log.FAIL
>
> Thanks!

I'm on it !
Thanks for reporting the problem.

Regards,
Julien
