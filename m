From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 28 Sep 2011 15:36:15 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
References: <000301cc7486$0778f8f0$166aead0$@com>
 <20110916184409.2b4f53ae@skate> <001601cc76d6$7c3d1ac0$74b75040$@com>
 <20110919224628.173080cd@skate> <op.v15jbakh705kjs@rico>
 <op.v2ij9pax705kjs@rico> <20110928141624.2136b1e2@skate>
Message-ID: <op.v2itepap705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.09.2011, 14:16 Uhr, schrieb Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com>:

> Le Wed, 28 Sep 2011 12:18:51 +0200,
> "Rico Bachmann" <bachmann@tofwerk.com> a ?crit :
>
>> Is there a good tutorial to use git send-email, at the moment i have
>> a patch
>> that allows me to build my rootfs with the libfcgi.
>> I attached the patches without git send-email. I hope it's not
>> totaly screwed up.
>
> You can read
> http://lists.busybox.net/pipermail/buildroot/2010-December/039181.html
> for a very basic introduction on how to contribute to Buildroot using
> git.
>
> Regards,
>
> Thomas

I'm now working with this link.
But I'm stock at this point:

after I did this cmd:

  git format-patch HEAD

i try to do this cmd:

  git send-email --to buildroot at uclibc.org --compose *.patch

the problem is, after git format-patch HEAD, i can't find any created  
patch!
