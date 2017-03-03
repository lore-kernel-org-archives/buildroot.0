From: ren_guo <ren_guo@c-sky.com>
Date: Fri, 3 Mar 2017 12:25:59 +0800
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <20170303030029.GI14124@waldemar-brodkorb.de>
References: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
 <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
 <20170303030029.GI14124@waldemar-brodkorb.de>
Message-ID: <3fff3e47-c3ef-4641-9c0a-30f9be5ff39c@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Waldemar

>> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
>   
> I tried your patchset, the toolchain is not downloadable, empty
> files in github.
>
> WARNING: no hash file for
> csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz
> mkdir -p /home/wbx/buildroot/output/build/toolchain-external-custom
> touch
> /home/wbx/buildroot/output/build/toolchain-external-custom/.stamp_downloaded

I use git-lfs to put these tools two days ago and i've tested it, but now it seems invalid.

https://github.com/c-sky/tools

I'll look into it right way.

>>>> toolchain-external-custom  Extracting
>>>> mkdir -p
>>>> /home/wbx/buildroot/output/build/toolchain-external-custom
> gzip -d -c
> /home/wbx/buildroot/dl/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz
> | tar --strip-components=1 -C
> /home/wbx/buildroot/output/build/toolchain-external-custom
> --exclude='usr/lib/locale/*'   -xf -
>
> gzip:
> /home/wbx/buildroot/dl/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz:
> not in gzip format
>
> Can the c-sky devboards be bought anywhere in Europe?

We have a taobao shop: https://shop145257746.taobao.com

And you can get some info from: www.c-sky.com

Best Regards

Guo Ren
