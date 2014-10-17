From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Oct 2014 11:24:47 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.18
In-Reply-To: <1413481717-9541-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413481717-9541-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141017112447.30a0b8ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Oct 2014 14:48:37 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-3669 - Integer overflow in unserialize() (32-bits only)
> CVE-2014-3670 - Heap corruption in exif_thumbnail()
> CVE-2014-3668 - Global buffer overflow in mkgmtime() function
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
