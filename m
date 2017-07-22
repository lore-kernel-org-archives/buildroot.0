From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:21:24 +0200
Subject: [Buildroot] [PATCH 1/3] efibootmgr: fix build with gcc 7.x
In-Reply-To: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170722232124.62c6e28b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 17:59:55 +0200, Thomas Petazzoni wrote:
> Now that the build of efivar with gcc 7.x has been fixed by commit
> 0ca30170345a81f5f21e4ef4424b1f186cde1988 ("efivar: fix build with gcc
> 7"), efibootmgr fails similarly with gcc 7.x.
> 
> This commit backports an upstream patch that fixes this issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...e-extra-const-keywords-gcc-7-gripes-about.patch | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
