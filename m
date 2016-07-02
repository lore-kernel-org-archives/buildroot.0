From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:17:52 +0200
Subject: [Buildroot] [autobuild-script] autobuild-run: remove the CS SH4
 toolchain exception
In-Reply-To: <1467453908-27165-1-git-send-email-romain.naour@smile.fr>
References: <1467453908-27165-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20160702131752.2fcbd767@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 12:05:08 +0200, Romain Naour wrote:
> The BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209 has been renamed
> in Buildroot and PRBOOM has been disabled for this toolchain.
> The exception can be safely be removed.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  scripts/autobuild-run | 3 ---
>  1 file changed, 3 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
