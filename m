From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 02:41:19 +0100
Subject: [Buildroot] [PATCH 1/1] bump libconfig to version 1.4.6
In-Reply-To: <5D84D73AF97C43079AA3F8DBD15187CD@apexjs> (Sagaert Johan's
	message of "Sat, 11 Dec 2010 00:44:30 +0100")
References: <5D84D73AF97C43079AA3F8DBD15187CD@apexjs>
Message-ID: <87lj3xnl1c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> diff -rupN package/libconfigorg/libconfig.mk package/libconfig/libconfig.mk
 Sagaert> --- package/libconfigorg/libconfig.mk 2010-11-30 16:52:43.000000000 +0100
 Sagaert> +++ package/libconfig/libconfig.mk 2010-12-11 00:41:00.000000000 +0100
 Sagaert> @@ -3,12 +3,13 @@
 Sagaert>  # libconfig
 Sagaert>  #
 Sagaert>  #############################################################
 Sagaert> -LIBCONFIG_VERSION:=1.3
 Sagaert> +LIBCONFIG_VERSION:=1.4.6
 Sagaert>  LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
 Sagaert>  LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
 Sagaert>  LIBCONFIG_AUTORECONF:=NO
 Sagaert>  LIBCONFIG_INSTALL_STAGING:=YES
 Sagaert>  LIBCONFIG_INSTALL_TARGET:=YES
 Sagaert> +LIBCONFIG_LIBTOOL_PATCH:=NO

Don't disable the libtool patch, otherwise it looks good - Committed,
thanks.

-- 
Bye, Peter Korsgaard
