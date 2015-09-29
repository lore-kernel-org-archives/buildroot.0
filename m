From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:42:01 +0200
Subject: [Buildroot] [PATCH 2/2] libbluray: disable BD-Java
In-Reply-To: <d9ffae28e4a1af40af0aa85e0b9275622ffe55b3.1443531503.git.baruch@tkos.co.il>
References: <c0676cbc3b883de88e98c9ba28d8023f17cb5e88.1443531503.git.baruch@tkos.co.il>
 <d9ffae28e4a1af40af0aa85e0b9275622ffe55b3.1443531503.git.baruch@tkos.co.il>
Message-ID: <20150929194201.7b17dd80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 29 Sep 2015 15:58:23 +0300, Baruch Siach wrote:
> BD-Java requires host-ant which is not currently available in Buildroot.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e87/e8790359cc12d73a22a168a61f59215e50a58f0f/
> http://autobuild.buildroot.net/results/bb3/bb33effb844fd6c06efa033cc3e3cb4b4495d1d5/
> http://autobuild.buildroot.net/results/623/623de2013eba2bff2d0863968e76f299488f9f35/
> 
> and more.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libbluray/libbluray.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
