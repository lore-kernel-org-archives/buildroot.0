From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:50:27 +0100
Subject: [Buildroot] [PATCH] package/gcc: 4.9.x: backport a fix for
 libcap-ng issue on nios2
In-Reply-To: <1457177496-11919-1-git-send-email-romain.naour@gmail.com>
References: <1457177496-11919-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160305145027.01c00297@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  5 Mar 2016 12:31:36 +0100, Romain Naour wrote:
> The patch is part of gcc 5.3 release.
> 
> Fixes:
> http://autobuild.buildroot.net/results/901/90186d1fe134b804c0101554296b1235dc0ccbb0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  .../gcc/4.9.3/880-nios2_legitimize_address.patch   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/gcc/4.9.3/880-nios2_legitimize_address.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
