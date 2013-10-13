From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 15:33:55 +0200
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131013153355.3839117b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 10 Oct 2013 11:40:42 +0200, J?r?me Pouiller wrote:
> Since default configure options for host packages include
> --disable-static, gcc was not configured to build static version of its
> libraries (libgcc.a, libstdc++.a, ...).

I'm a bit confused, the toolchains I have here definitely do have
libgcc.a :

$ find . -name 'libgcc.a'
./host/usr/lib/gcc/sh4-buildroot-linux-uclibc/4.7.3/libgcc.a

What practical issue are you seeing?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
