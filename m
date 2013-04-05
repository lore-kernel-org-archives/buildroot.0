From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 05 Apr 2013 07:47:02 -0300
Subject: [Buildroot] [PATCH] aircrack-ng: needs toolchain with threads
 support
In-Reply-To: <1365116959-25148-1-git-send-email-gilles.talis@gmail.com>
References: <1365116959-25148-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <515EABA6.8000302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/2013 08:09 PM, Gilles Talis wrote:

> Fixes:
> http://autobuild.buildroot.org/results/418c9385a9a5a5087a6790001560056d32cd9708
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # iw

However it's not because of iw, it's because of aircrack itself
(aircrack is failing to compile) :)
Regards.
