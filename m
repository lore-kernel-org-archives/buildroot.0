From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:41:43 +0200
Subject: [Buildroot] [PATCH 1/1] nmap: update license
In-Reply-To: <20181004172730.12889-1-fontaine.fabrice@gmail.com>
References: <20181004172730.12889-1-fontaine.fabrice@gmail.com>
Message-ID: <20181006154143.44ec552a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Yann in Cc, licensing question below.

On Thu,  4 Oct 2018 19:27:30 +0200, Fabrice Fontaine wrote:
> nmap is licensed under GPL-2.0 but with exceptions or a commercial
> license (see COPYING, especially the "IMPORTANT NMAP LICENSE TERMS"
> part)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nmap/nmap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 420aec82d7..6b7502b02b 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>  NMAP_DEPENDENCIES = libpcap
>  NMAP_CONF_OPTS = --without-liblua --without-zenmap \
>  	--with-libdnet=included --with-liblinear=included
> -NMAP_LICENSE = GPL-2.0
> +NMAP_LICENSE = GPL-2.0 with exceptions or commercial

I agree with the GPL-2.0 with exceptions, Debian also calls the license
nmap-GPL-2
(https://metadata.ftp-master.debian.org/changelogs/main/n/nmap/nmap_7.70+dfsg1-3_copyright).

However, I'm not sure about the "or commercial". We used to have that
for Qt, but dropped it, I'm not sure to remember why. Yann ?

>  NMAP_LICENSE_FILES = COPYING
>  
>  # needed by libpcap



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
