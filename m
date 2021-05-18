From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 18 May 2021 17:17:37 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to
 2.4.106
References: <20210518044626.17073-1-bernd.kuhls@t-online.de>
 <20210518120105.GB2506__49536.9530793809$1621339293$gmane$org@scaer>
Message-ID: <hd2dnhx29h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 18 May 2021 14:01:05 +0200 schrieb Yann E. MORIN:

> You tagged that one for next, but this is actually a minor release that
> fixes a regression, and adds just a bunch of tests and debug here and
> there....
> 
> Is there a reason why that can't be applied to master?

Hi Yann,

maybe I am missing some informations but afaics there are no written 
rules which I can follow when deciding whether a patch is valid for -
master or -next. When in doubt, especially with a bump like this one 
which not only fixes bugs but also adds new code, I prefer to send a 
patch for -next so Thomas, Peter, Arnout or you can decide otherwise.

Regards, Bernd
