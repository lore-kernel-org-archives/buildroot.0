From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Aug 2019 22:48:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/bzip2: security bump version to
 1.0.8
References: <20190803195526.24827-1-bernd.kuhls@t-online.de>
 <878ssa7zwj.fsf@dell.be.48ers.dk>
Message-ID: <dh8h1gxvf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 03 Aug 2019 22:33:00 +0200 schrieb Peter Korsgaard:

> But we already have a fix for CVE-2019-12900 in
> 0003-Make-sure-nSelectors-is-not-out-of-range.patch. How come you are
> not removing it?

Hi Peter,

because the patch did not fail to apply to 1.0.8 and does not contain any 
mention about being a CVE fix.

In fact this patch was reverted upstream for the 1.0.8 release:
https://sourceware.org/git/?
p=bzip2.git;a=commitdiff;h=b07b105d1b66e32760095e3602261738443b9e13

Thanks for the hint, sent v2: http://patchwork.ozlabs.org/patch/1141605/

Regards, Bernd
