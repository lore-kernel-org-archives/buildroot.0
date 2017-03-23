From: ren_guo <ren_guo@c-sky.com>
Date: Thu, 23 Mar 2017 17:32:32 +0800
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <20170323102331.6f245905@free-electrons.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
 <20170320224839.6677ccd0@free-electrons.com>
 <d2d57c6c-b3b0-2bc8-71a4-d6fe3578a804@c-sky.com>
 <20170323101042.186c3fc6@free-electrons.com>
 <b11495d8-a875-decb-ad32-4ff257023ac6@c-sky.com>
 <20170323102331.6f245905@free-electrons.com>
Message-ID: <3767f162-d03e-1480-7f79-c7c38f3cfeea@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> OK, then please send a patch, but you also need to change the relative
> path to the gdbinit file, it was not correct in your example, it should
> be:
>
> 	-x ../../board/csky/...

Yes, it's wrong in my example, and I want use post-image.sh to copy the gdbinit to the output/images.

and the readme will be changed like this:

$ cd output/images

$ ../host/usr/bin/csky-linux-gdb -x gdbinit vmlinux

-- 
Guo Ren, Software Engineer, C-SKY
3 XiDoumen Rd,BldgA,15F,Hangzhou,China
P.C: 310012
http://www.c-sky.com
