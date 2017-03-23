From: ren_guo <ren_guo@c-sky.com>
Date: Thu, 23 Mar 2017 17:05:33 +0800
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <20170320224839.6677ccd0@free-electrons.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
 <20170320224839.6677ccd0@free-electrons.com>
Message-ID: <d2d57c6c-b3b0-2bc8-71a4-d6fe3578a804@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> I've removed this entirely, and just changed the readme.txt
> instructions to tell people to run:
>
>    ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
>
> By referencing the gdbinit file using the -x option, we don't have to
> copy it around in an hidden file.
>
gdbinit need load gx6605s.dtb to a memory address, so we need run it  in output/images like this:

$ cd output/images

$ ../host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit vmlinux

Best Regards

guoren

-- 
Guo Ren, Software Engineer, C-SKY
3 XiDoumen Rd,BldgA,15F,Hangzhou,China
P.C: 310012
http://www.c-sky.com
