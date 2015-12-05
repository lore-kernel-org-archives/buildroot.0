From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Dec 2015 23:09:32 +0100
Subject: [Buildroot] [PATCH v2 6/6] package/perl-mail-spamassassin: new
	package
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
 <1430041039-13905-6-git-send-email-bernd.kuhls@t-online.de>
 <20150426120256.63387117@free-electrons.com>
 <XnsA488837A5F7C7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150426222523.15bca0d4@free-electrons.com>
Message-ID: <st3cjcx654.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 26 Apr 2015 22:25:23 +0200 schrieb Thomas Petazzoni:

> Bernd, Fran?ois,
> 
> On Sun, 26 Apr 2015 12:55:29 +0200, Bernd Kuhls wrote:
> 
>> > On Sun, 26 Apr 2015 11:37:19 +0200, Bernd Kuhls wrote:
>> >> This package contains a dependency check which only checks for
>> >> installed modules in host-perl, not the target variant. Therefore
>> >> some host package of perl modules are needed as dependency.
>> > 
>> > What about fixing Spamassassin instead?
>> 
>> Hi Thomas,
>> 
>> I tried and failed:
>> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/114369
> 
> Argh. Fran?ois, maybe you can help on this by having a look?

Hi Thomas,

I am closing my Spamassassin patch series

http://patchwork.ozlabs.org/patch/464634/
http://patchwork.ozlabs.org/patch/464631/
http://patchwork.ozlabs.org/patch/464633/
http://patchwork.ozlabs.org/patch/464635/

as superseded because Fran?ois fixed the Spamassassin configure problem:
http://patchwork.ozlabs.org/patch/552870/

Regards, Bernd
