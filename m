From: Kevin Wilson <wkevils@gmail.com>
Date: Thu, 21 Jun 2012 15:16:14 +0300
Subject: [Buildroot] preparing rootfs with gcc in buildroot
Message-ID: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have buildroot-2012.02.
The host is x86, the target is arm.
I work with it, prepare fs , boot it ok, etc.

Now it doesen't have gcc.
I want to prepare a rootfilesystem with gcc
(output/images/rootfs.tar)

I run:
make menuconfig
  Package selection for target
     Development tools
        "gcc needs development files in target filesystems"


rgs,
Kevin
