From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:02:44 +0100
Subject: [Buildroot] [PATCH 1/2] python-psutil: bump to version 5.2.0
In-Reply-To: <e713d348e9a896e71f8b203d84a81bc0fd7a8a8b.1489344573.git.baruch@tkos.co.il>
References: <e713d348e9a896e71f8b203d84a81bc0fd7a8a8b.1489344573.git.baruch@tkos.co.il>
Message-ID: <20170312230244.7bcb6757@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 20:49:32 +0200, Baruch Siach wrote:
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/python-psutil/python-psutil.hash | 4 ++--
>  package/python-psutil/python-psutil.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Both applied to master, thanks! And thanks a lot for following up on
the musl issue for this package, re-enabling it and its reverse
dependencies when possible. Definitely nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
