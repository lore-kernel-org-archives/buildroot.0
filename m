From: Joachim Pihl <jpihl@nevion.com>
Date: Thu, 3 Dec 2009 17:54:51 +0100
Subject: [Buildroot] [git commit master] kernel-headers: add 2.6.32
In-Reply-To: <20091203163920.709DF777B6@busybox.osuosl.org>
References: <20091203163920.709DF777B6@busybox.osuosl.org>
Message-ID: <op.u4dfxpxuyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 03 Dec 2009 15:59:15 +0100, Peter Korsgaard <jacmet@sunsite.dk>  
wrote:

>  	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
>  	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
>  	default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
> +	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_31

that should  probably be BR2_KERNEL_HEADERS_2_6_32 ?

-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
