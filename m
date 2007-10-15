From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 15 Oct 2007 16:59:50 +0100
Subject: [Buildroot] PATCH: lm-sensors - correct patch version
In-Reply-To: <47113AF7.1050704@promwad.com>
References: <47113AF7.1050704@promwad.com>
Message-ID: <47138E76.3070205@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have verified this patch is needed & works, can someone commit it?

Regards,

Will.

Ivan Kuten wrote:
> lm-sensors - correct patch version, now download&build successful:
> 
> Index: package/lm-sensors/lm-sensors.mk
> ===================================================================
> --- package/lm-sensors/lm-sensors.mk    (revision 20237)
> +++ package/lm-sensors/lm-sensors.mk    (working copy)
> @@ -5,7 +5,7 @@
>  #############################################################
>  LM_SENSORS_VERSION:=2.10.4
>  LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
> -LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-1.diff.gz
> +LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-3.diff.gz
>  LM_SENSORS_SITE:=http://ftp.debian.org/debian/pool/main/l/lm-sensors/
>  LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
>  LM_SENSORS_CAT:=$(ZCAT)
> 
> 
> Best regards,
> Ivan
> --------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
