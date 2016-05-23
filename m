From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 20:14:05 +0200
Subject: [Buildroot] [PATCH] libxml2: security bump to version 2.9.4
In-Reply-To: <f46d54cfeae4ab63d1820c71f41a732160290159.1464025294.git.baruch@tkos.co.il>
References: <f46d54cfeae4ab63d1820c71f41a732160290159.1464025294.git.baruch@tkos.co.il>
Message-ID: <20160523201405.0e3edd13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 20:41:34 +0300, Baruch Siach wrote:
> Fixes a bunch of security issues including:
> 
>   CVE-2016-1762: Heap-based buffer overread in xmlNextChar
> 
>   CVE-2016-1834: heap-buffer-overflow in xmlStrncat
> 
>   CVE-2016-3705: Missing increments of recursion depth counter to XML parser
> 
> A few more security fixes are listed in the release announcement at
> https://mail.gnome.org/archives/xml/2016-May/msg00023.html.
> 
> Also fixes:
> http://autobuild.buildroot.net/results/6db/6db405a097b192876c0b1b8d59051d614563c617/
> http://autobuild.buildroot.net/results/62a/62addf4abd2a0df8222a81a83c16b2b9a61c9481/
> http://autobuild.buildroot.net/results/204/20402690ad05d10d456a219da5252a38badf1da0/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libxml2/libxml2.hash | 2 +-
>  package/libxml2/libxml2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
