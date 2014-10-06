From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 06 Oct 2014 21:33:38 +0200
Subject: [Buildroot] [PATCH v2 08/16] package/apr-util: add optional
	dependency to openssl
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
 <1412530744-20649-9-git-send-email-bernd.kuhls@t-online.de>
 <20141005203902.5d8c5dcf@free-electrons.com>
Message-ID: <XnsA3BEDB53972CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141005203902.5d8c5dcf at free-electrons.com:

> This looks weird, because there's no symmetry between --with-openssl
> --with-crypto and --without-ssl. Isn't there an issue here?

Hi Thomas,

I sent v3 of this patch: http://patchwork.ozlabs.org/patch/396912/
and superseeded the buggy version in patchworks.

Is it ok to only send a single patch and not the whole series again? This 
patch does not depend on the other patches of the apache/php series.

Regards, Bernd
