From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:46:40 +0200
Subject: [Buildroot] [PATCH] gcc: bump 4.9 series to 4.9.4
In-Reply-To: <1470260904-27174-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470260904-27174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160804224640.40b42991@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Aug 2016 23:48:24 +0200, Thomas Petazzoni wrote:
> Two patches are removed, as they have been upstreamed:
> 
>  - 130-fix_build_with_gcc-6.patch (svn commit 233721, Git commit
>    8c3fa311caa86f61b4e28d1563d1110b44340fb2)
> 
>  - 920-libgcc-remove-unistd-header.patch (svn commit 226092, Git commit
>    e940d7953f06af11d09229a29ecbcc1ba25b378d)
> 
> All other patches have simply been refreshed, with no manual edit
> needed.
> 
> A build+runtime test has been done with an ARM, Cortex-A8, EABIhf, musl
> configuration, booted under Qemu.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
