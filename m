From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 16 Dec 2020 22:25:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/bind: fix mdig library
 dependencies
References: <20201212091306.222405-1-bernd.kuhls@t-online.de>
 <20201212091306.222405-2-bernd.kuhls@t-online.de>
 <20201214231433.6cbf6aab@gmx.net>
Message-ID: <sjaqahxhgg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Mon, 14 Dec 2020 23:14:33 +0100 schrieb Peter Seiderer:

>> +Upstream status: pending upload
> 
> What does 'pending upload' mean?

this describes the fact that I am unable to register on gitlab.com, their 
verification mail does not arrive so I can not activate my account ;)

> Dependency entry '${ISCCFGDEPLIBS}' missing?

Yes, combined with your upstream patch I think your patch should be 
applied, so I closed mine as "rejected".

Regards, Bernd
