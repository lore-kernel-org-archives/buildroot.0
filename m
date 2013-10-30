From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 19:11:06 +0100
Subject: [Buildroot] [PATCH 0/3] Misc toolchain fixes
In-Reply-To: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131030191106.43e00205@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 29 Oct 2013 21:53:59 +0100, Thomas Petazzoni wrote:

> Here is a small set of misc toolchain fixes: fix for Linaro toolchain
> usage and comment, fix to install libthread_db in more cases (i.e when
> gdb native is installed on the target).
> 
> Thomas
> 
> Thomas Petazzoni (3):
>   toolchain-external: add missing symlink for Linaro toolchains
>   toolchain-external: fix visibility and length of Linaro toolchain
>     comment
>   glibc, toolchain-external: copy libthread_db when gdb is enabled

I have applied those three patches to for-peter-2013.11.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
