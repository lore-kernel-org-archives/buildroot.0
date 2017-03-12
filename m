From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:03:18 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix build with musl
In-Reply-To: <2de4e674599224ed047b62d71f6648bf7a9918b4.1489341451.git.baruch@tkos.co.il>
References: <2de4e674599224ed047b62d71f6648bf7a9918b4.1489341451.git.baruch@tkos.co.il>
Message-ID: <20170312230318.238bd513@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 19:57:31 +0200, Baruch Siach wrote:
> Add a patch adding the required limits headers.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dd5/dd556f2adc449c4961ff425c52fb78c5279bfae7/
> http://autobuild.buildroot.net/results/7b5/7b5ccd88cdedd02d7fe77d4a07dd88d4045f4284/
> http://autobuild.buildroot.net/results/ab1/ab12d07c73e3f8af102f00bd2e7124f6c6a076c3/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...03-btrfs-progs-add-missing-limits-headers.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
