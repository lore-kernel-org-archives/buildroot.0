From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 05 Oct 2014 20:47:34 +0200
Subject: [Buildroot] [PATCH v2 08/16] package/apr-util: add optional
	dependency to openssl
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
 <1412530744-20649-9-git-send-email-bernd.kuhls@t-online.de>
 <20141005203902.5d8c5dcf@free-electrons.com>
Message-ID: <XnsA3BDD3838E18DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141005203902.5d8c5dcf at free-electrons.com:

>> +APR_UTIL_CONF_OPTS += --without-ssl
>> +endif
> 
> This looks weird, because there's no symmetry between --with-openssl
> --with-crypto and --without-ssl. Isn't there an issue here?

Hi,

oops, without-ssl should have been without-crypto.

To enable OpenSSL support

a) --with-crypto is needed to enable the crypto stuff as such and
b) --with-openssl to enable the use of the OpenSSL library itself.

I will update this patch in v3, thanks!

Regards, Bernd
