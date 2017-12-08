From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 17:48:55 +0100
Subject: [Buildroot] [PATCH v2] kvmtool: bump to f77d646ba0
In-Reply-To: <20171207041956.8124-1-matthew.weber@rockwellcollins.com>
References: <20171207041956.8124-1-matthew.weber@rockwellcollins.com>
Message-ID: <20171208174855.3a8428a9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Dec 2017 22:19:56 -0600, Matt Weber wrote:
> Upstream Commit:
> 2017-11-03 16:19:58 +0000
> irq.h: fix compilation error due to missing bool type
> 
> The following patches were updated/removed.
> 
> - 0001-avoid-redefining-PAGE_SIZE.patch is removed, as
>   it has been merged upstream as of commit 4095fac8
> 
> - 0002-x86-kvm-cpu.c-don-t-include-asm-msr-index.h.patch is
>   removed, as it has been merged upstream as of commit
>   1cc05b24
> 
> - 0003-use-poll.h-instead-of-sys-poll.h.patch is removed,
>   as it has been merged upstream as of commit 52c22e6e
> 
> - 0004-check-for-and-use-C-library-provided-strlcpy-and-str.patch
>   is removed, as it has been merged upstream as of commit
>   8f22adc4
> 
> - 0005-Fix-call-to-connect.patch is removed, as it has been
>   merged upstream as of commit d77bd4f4
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> v1 -> v2
> [Thomas P.
>  - Resolved build issue on x86_64 related to gcc being used
>    for linking vs the previous version directly calling ld.
>    This removed the need to explicitly define the elf format.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
