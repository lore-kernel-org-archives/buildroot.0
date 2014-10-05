From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 05 Oct 2014 18:30:40 +0200
Subject: [Buildroot] [PATCH 1/8] package/apr: Bump version to 1.5.1
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <20141005144248.GG4220@free.fr> <20141005181638.2614c86f@free-electrons.com>
Message-ID: <XnsA3BDBC4D8D9A7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141005181638.2614c86f at free-electrons.com:

> I'm confused: if some pieces of code are already upstream and
> backported, why do they need to be submitted upstream again?

Hi Thomas,

both Apache httpd and standalone apr contain the source for gen_test_char, 
the cross-compile patches were only applied to the build system of httpd, not 
apr, therefore the need for the backport.

Regards, Bernd
