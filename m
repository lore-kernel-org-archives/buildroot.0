From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 17:30:26 +0200
Subject: [Buildroot] [PATCH 6/6] package/perl-mail-spamassassin: new
	package
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
 <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
 <20150425164617.43f7db2e@free-electrons.com>
Message-ID: <XnsA487B2174A825berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150425164617.43f7db2e at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Sat, 25 Apr 2015 15:54:48 +0200, Bernd Kuhls wrote:
>> This package contains a dependency check which only checks for installed
>> modules in host-perl, not the target variant. Therefore some host package
>> of perl modules are needed as dependency.
> 
> Are they needed because they are used, or needed just to please the
> dependency checks of spamassassin?

Hi Thomas,

the host-packages are only needed to please spamassassin afaics.
Their target variants however are really used by Spamassassin:

http://deps.cpantesters.org/?module=Mail%3A%3ASpamAssassin;perl=latest

Regards, Bernd
