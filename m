From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 13 Oct 2013 18:02:12 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <20131013155620.GB16563@free.fr>
References: <525AAE63.3060601@gmail.com> <20131013155620.GB16563@free.fr>
Message-ID: <525AC404.40406@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/10/2013 17:56, Yann E. MORIN ha scritto:
> Have you checked it does not end in another directory beside 'extra'?
>      find output/target/lib/modules/kernel_version/extra/ |grep 'your-module.ko'


The extra directory is empty.
Anyway, if I type from the buildroot base directory:

find -name *.ko | grep s2253.ko

nothing is found
Mark
