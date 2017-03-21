From: ren_guo <ren_guo@c-sky.com>
Date: Tue, 21 Mar 2017 11:29:39 +0800
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <20170320224839.6677ccd0@free-electrons.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
 <20170320224839.6677ccd0@free-electrons.com>
Message-ID: <d5d111ec-e936-4e5c-32b5-17314d433047@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Thomas,

> I've removed this entirely, and just changed the readme.txt
> instructions to tell people to run:
>
>    ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
>
> By referencing the gdbinit file using the -x option, we don't have to
> copy it around in an hidden file.
>
"gdb -x" is great, I like it :)

Now I'm preparing more for this board, and it's a big encouragement for me.
Thanks for your careful reviewing.

Best Regards
guoren
