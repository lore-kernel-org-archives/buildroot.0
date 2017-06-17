From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 17 Jun 2017 23:40:39 +0200
Subject: [Buildroot] [PATCH v2] board: Add a13_olinuxino Support
In-Reply-To: <1497726908-1702-1-git-send-email-chakra@openedev.com>
References: <1497726908-1702-1-git-send-email-chakra@openedev.com>
Message-ID: <CAB0FRsvRrVcGa74QbpsTrAenzpynmh9NjzdHqG1d0MocPchwWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-17 21:15 GMT+02:00 Chakra Divi <2chakrass@gmail.com>:

> Add initial support for a13_olinuxino board
> with below features
> - U-Boot 2017.05
> - Linux 4.11.5
> - Default packages from buildroot
>
> Signed-off-by: Chakra Divi <chakra@openedev.com>
> ---
> Changes for v2:
> - Add missing readme.txt
>
>  .gitlab-ci.yml                           |    1 +
>  board/olimex/a13_olinuxino/boot.cmd      |    7 +++++
>  board/olimex/a13_olinuxino/genimage.cfg  |   34 +++++++++++++++++++++++
>  board/olimex/a13_olinuxino/post-build.sh |    9 ++++++
>  board/olimex/a13_olinuxino/readme.txt    |   43
> +++++++++++++++++++++++++++++
>  configs/olimex_a13_olinuxino_defconfig   |   44
> ++++++++++++++++++++++++++++++
>  6 files changed, 138 insertions(+)
>  create mode 100644 board/olimex/a13_olinuxino/boot.cmd
>  create mode 100644 board/olimex/a13_olinuxino/genimage.cfg
>  create mode 100755 board/olimex/a13_olinuxino/post-build.sh
>

I think you could reuse board/olimex/a20_olinuxino/post-build.sh

Fran?ois


>  create mode 100644 board/olimex/a13_olinuxino/readme.txt
>  create mode 100644 configs/olimex_a13_olinuxino_defconfig
>
> _
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170617/441e4990/attachment.html>
