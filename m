From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:12:37 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{17, 14, 12,
 10}.x series
In-Reply-To: <1417993744-10058-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417993744-10058-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141208001237.07b479f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  7 Dec 2014 20:09:03 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-headers/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Both patches applied, thanks!

> -	default "3.17.4"	if BR2_KERNEL_HEADERS_3_17
> +	default "3.17.6"	if BR2_KERNEL_HEADERS_3_17

What! We missed updating from .4 to .5 ! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
