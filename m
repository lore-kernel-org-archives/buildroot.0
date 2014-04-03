From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:21:21 +0200
Subject: [Buildroot] [PATCH] xbmc: Fix Java dependency check
In-Reply-To: <1396254432-22594-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1396254432-22594-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140403202121.1ee97516@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon, 31 Mar 2014 10:27:12 +0200, Maxime Hadjinlian wrote:
> A check for Java has been implemented in dependencies.sh, but during the
> review, the name of the variable had been changed from:
> BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA
> as it is more accurate.
> 
> The change was not made in XBMC and as such, you could start the build
> of XBMC without Java on your system.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/xbmc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
