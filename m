From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 17 Apr 2012 14:22:35 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
References: <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
 <20120417133932.4552d886@skate> <873982lg86.fsf@macbook.be.48ers.dk>
Message-ID: <op.wcwsnxnm705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 17.04.2012, 14:01 Uhr, schrieb Peter Korsgaard  
<jacmet@uclibc.org>:

>>>>>> "Thomas" == Thomas Petazzoni  
>>>>>> <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>  
>>>>>> writes:
>
> Hi,
>
>  >> +	bool "libapr"
>  >> +	help
>  >> +	  The mission of the Apache Portable Runtime (APR) project is to  
> create and maintain software libraries that provide a predictable and  
> consistent interface to underlying platform-specific implementations
>
>  Thomas> This text should be wrapped at ~80 columns.
>
> And the upstream URL should be added below.
>
>  >> new file mode 100644
>  >> index 0000000..57da8ef
>  >> --- /dev/null
>  >> +++ b/package/libapr/libapr.mk
>  >> @@ -0,0 +1,12 @@
>  >> +#############################################################
>  >> +#
>  >> +# libapr
>  >> +#
>  >> +#############################################################
>  >> +LIBAPR_VERSION = 1.4.6
>  >> +LIBAPR_SOURCE = apr-$(LIBAPR_VERSION).tar.gz
>
>  Thomas> Yegor's suggestion didn't work because by default we download
>  Thomas> <package-name>-<package-version>.tar.gz. However here you  
> decided to
>  Thomas> name the Buildroot package "libapr", while the upstream package  
> is
>  Thomas> "apr". Maybe we should use the "apr" name like upstream?
>
> Agreed.

I'll do that change with my next patch

>
>  >> +LIBAPR_SITE = http://mirror.switch.ch/mirror/apache/dist/apr
>
> I know the apr website directs you to a local mirror, but perhaps it
> would make more sense to use archive.apache.org/dist/apr instead of this
> .ch mirror?
>

ah i didn't saw that i used a local mirror, i'll change that to.

-- 
Erstellt mit Operas revolution?rem E-Mail-Modul: http://www.opera.com/mail/
