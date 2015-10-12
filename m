From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:34:40 +0200
Subject: [Buildroot] [PATCH v2] Add support for mips32r6 and mips64r6
 target architecture variants
In-Reply-To: <1444644486-11117-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444644486-11117-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151012213440.1528b198@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 12 Oct 2015 11:08:06 +0100, Vicente Olivert Riera wrote:
> - Add support for mips32r6 and mips64r6 target architecture variants
> - Disable unsupported gcc versions
> - Disable unsupported binutils versions
> - Disable unsupported external toolchains
> - Disable unsuported C libraries
> - Add a hook in order to make glibc compile for MIPS R6.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Rebase on top of master
>   - Change the "Broken" comments to "Unsupported" (Suggested by Thomas)
>   - Specify why we choose the 4.0.0 version for the glibc hook
>   - Add 32r6 and 64r6 in the help message of arch/Config.in.mips

Applied after slightly tweaking the glibc hack explanation, as
discussed on IRC.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
