From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 10:12:22 +0200
Subject: [Buildroot] [PATCH] package/acpica: disable -Werror
In-Reply-To: <1468160051-23957-1-git-send-email-yann.morin.1998@free.fr>
References: <1468160051-23957-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160716101222.7d69a515@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 16:14:11 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/d17/d1728c29e90d978405d24bb97f5c8687dc5a6165/
>     http://autobuild.buildroot.org/results/2ec/2ecdf0e87a76781b66098d034768fc8de657faaa/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/acpica/0001-build-do-not-use-Werror.patch | 62 +++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/acpica/0001-build-do-not-use-Werror.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
