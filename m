From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:40:25 +0200
Subject: [Buildroot] [PATCH 0/3] Fix SSP related build failures
In-Reply-To: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151018154025.001778e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Oct 2015 15:09:07 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (3):
>   toolchain: like glibc, musl always provides SSP support
>   gcc: pass explicit gcc_cv_libc_provides_ssp also to gcc-final
>   gcc: simplify musl patches for SSP support

Thanks to Yann's review, I've applied those patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
