From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:38:02 +0200
Subject: [Buildroot] [PATCH next] iproute2: drop obsolete patch
In-Reply-To: <3f1f6da8f2c5cb78bfb9d7273291dd755d345a6f.1495488344.git.baruch@tkos.co.il>
References: <3f1f6da8f2c5cb78bfb9d7273291dd755d345a6f.1495488344.git.baruch@tkos.co.il>
Message-ID: <20170523153802.604851ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 00:25:44 +0300, Baruch Siach wrote:
> Since version 4.5.0 the iptables_common.h header is unused. Don't bother
> patching this file.
> 
> Renumber the following patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0002-Add-missing-sys-types.h-include.patch     | 38 ----------------------
>  ...ch => 0002-ip-include-libc-headers-first.patch} |  0
>  2 files changed, 38 deletions(-)
>  delete mode 100644 package/iproute2/0002-Add-missing-sys-types.h-include.patch
>  rename package/iproute2/{0003-ip-include-libc-headers-first.patch => 0002-ip-include-libc-headers-first.patch} (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
