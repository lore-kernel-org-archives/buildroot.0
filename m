From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:57:49 +0200
Subject: [Buildroot] [PATCH 0/2] xtensa noMMU support
In-Reply-To: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
References: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160331035749.2a03ba86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 18:27:02 +0300, Max Filippov wrote:

> this series enables noMMU support for xtensa.
> noMMU xtensa uses FLAT binaries and linuxthreads.
> This series assumes elf2flt support for Xtensa.

Is this actually the case?

> Max Filippov (2):
>   gcc: add xtensa uClinux support
>   uclibc: enable linuxthreads for xtensa

Applied, thanks!

Is it possible to boot a noMMU Xtensa system under Qemu ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
