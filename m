From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:28:34 +0200
Subject: [Buildroot] [PATCH 0/2] uclibc: Add some 0.9.33.2 patches for
 MIPS
In-Reply-To: <1386608704-3761-1-git-send-email-james.hogan@imgtec.com>
References: <1386608704-3761-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <20140609112834.4b11f803@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Hogan,

On Mon, 9 Dec 2013 17:05:02 +0000, James Hogan wrote:
> Add some of patches from uClibc upstream to fix EFD_NONBLOCK (which
> breaks QEMU) and __SIGRTMAX (which breaks GDB) on MIPS.
> 
> James Hogan (2):
>   uclibc: add patch to fix arch specific eventfd defs
>   uclibc: add patches to fix MIPS __SIGRTMAX and SIG127

Patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
