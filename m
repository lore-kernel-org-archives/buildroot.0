From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:52:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/exiv2: needs threads
In-Reply-To: <20170604080457.7593-1-bernd.kuhls@t-online.de>
References: <20170604080457.7593-1-bernd.kuhls@t-online.de>
Message-ID: <20170605115234.1719d12f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 10:04:56 +0200, Bernd Kuhls wrote:
> Exiv2 itself depends on threads, not only with xmp support.
> 
> Follow-up patch for http://patchwork.ozlabs.org/patch/770813/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exiv2/Config.in | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
