From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Thu, 29 May 2014 11:41:51 +0300
Subject: [Buildroot] [PATCH v2 1/1] qt5base: stop qt stripping installed
	libraries
In-Reply-To: <1401348717-16224-1-git-send-email-will_wagner@carallon.com>
References: <1401348717-16224-1-git-send-email-will_wagner@carallon.com>
Message-ID: <201405291141.52067.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 29 May 2014 10:31:57 will_wagner at carallon.com wrote:
> From: Will Wagner <will_wagner@carallon.com>
> 
> By default the 'make install' step for qt5base will strip all the binaries
> and libraries when they are installed to staging. This hinders debugging
> as the libraries in staging dir have been stripped and is unnecessary
> as buildroot will strip all files on the target
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Fatih A??c? <fatih.asici@gmail.com>

Regards,
Fatih
