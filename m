From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 14 May 2011 17:35:19 +0000 (UTC)
Subject: [Buildroot] package management
References: <BANLkTin3bxewdj6C5GYugDTt0Uu9ek4P9w@mail.gmail.com>
	<20110514115341.6706c4f5@surf> <iqm18j$peg$1@dough.gmane.org>
	<20110514172642.3798873a@surf>
Message-ID: <iqmegn$tj3$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-05-14, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 14 May 2011 13:49:07 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> > Soon, quite certainly not. Someday, maybe. But there's a lot of
>> > work to be done at the package infrastructure level to make this
>> > possible. It is not as simple as one might initially think to add
>> > this kind of features.
>> 
>> I'm curious about this.  I'm using ipkg and it works fine.  Opkg seems
>> to be based on (and very similar to) ipkg.  What is different about
>> opkg that makes it difficult?
>
> Maybe I misunderstood Xianghua initial request.

Or perhaps I did.

> I thought he was asking for Buildroot to generate ipkg/opkg packages,
> which Buildroot isn't capable of doing at the moment.

Ah, he probably was.

> If he is asking about having the opkg/ipkg-utils installed in a
> Buildroot system, then obviously it's fairly easy.

That's what I'm doing with ipkg.  I have ipkg utilties enabled in my
buildroot system.  My "user" applications are built outside of
buildroot and packaged using ipkg.  Then I install them on the
buildroot target using ipkg.

-- 
Grant Edwards               grant.b.edwards        Yow! Now that I have my
                                  at               "APPLE", I comprehend COST
                              gmail.com            ACCOUNTING!!
