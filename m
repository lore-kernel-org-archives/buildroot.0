From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 01:17:21 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
Message-ID: <htq9qcxf4f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 22 Feb 2016 15:05:39 +0100 schrieb Thomas Petazzoni:

>>          arm | kodi-pvr-argustv-32f03271cc... | NOK |
>>          http://autobuild.buildroot.net/results/
dacc3bd00ab2346d7655c0a1fb99f6c50b9da08b/
> 
> Bernd ?

Hi Thomas,

fixed by backport of upstream fix:
http://patchwork.ozlabs.org/patch/589468/

Similar bugs in other pvr addons are fixed by
http://patchwork.ozlabs.org/patch/589467/
http://patchwork.ozlabs.org/patch/589469/

Regards, Bernd
