From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:50:43 +0200
Subject: [Buildroot] [PATCH] log4cpp: needs threads
In-Reply-To: <8fb36864db8c572ca0d74de960eddaf4fa652eba.1466062678.git.baruch@tkos.co.il>
References: <8fb36864db8c572ca0d74de960eddaf4fa652eba.1466062678.git.baruch@tkos.co.il>
Message-ID: <20160616155043.71c6ee38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 10:37:58 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/cf9/cf942e4b8a5259414a4dcea6fa4b75183435394a/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/log4cpp/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
