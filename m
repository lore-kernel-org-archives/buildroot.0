From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2008 09:06:37 +0200
Subject: [Buildroot] "make menuconfig" error
In-Reply-To: <8c09713c0810092354j5ec58b17y47ac9a8e2fddf5fb@mail.gmail.com>
References: <8c09713c0810092354j5ec58b17y47ac9a8e2fddf5fb@mail.gmail.com>
Message-ID: <20081010090637.022d4fe3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 10 Oct 2008 14:54:45 +0800,
Jerry.Zhang <jerry.scofield@gmail.com> a ?crit :

> conf.c:6:19: error: ctype.h: No such file or directory
> conf.c:7:20: error: stdlib.h: No such file or directory
> conf.c:8:19: error: stdio.h: No such file or directory
> conf.c:9:20: error: string.h: No such file or directory
> conf.c:10:20: error: unistd.h: No such file or directory
> conf.c:11:18: error: time.h: No such file or directory
> conf.c:12:22: error: sys/stat.h: No such file or directory

apt-get install libc6-dev

and while you're at it, also install libncurses5-dev.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
