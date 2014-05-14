From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 14 May 2014 20:57:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: needs MMU (fork)
References: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
 <1400092133-16971-2-git-send-email-bernd.kuhls@t-online.de>
 <20140514183816.GI4096@tarshish>
Message-ID: <6uqc4bxpjv.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> wrote in
news:20140514183816.GI4096 at tarshish: 

>> +     depends on BR2_USE_MMU # fork()
> 
> Please also update the dependencies comment.

Hi,

afaics nowhere in buildroot exists a comment for the !BR2_USE_MMU case.

Regards, Bernd
