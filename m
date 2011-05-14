From: Xianghua Xiao <xiaoxianghua@gmail.com>
Date: Sat, 14 May 2011 16:31:55 -0500
Subject: [Buildroot] package management
In-Reply-To: <20110514172642.3798873a@surf>
References: <BANLkTin3bxewdj6C5GYugDTt0Uu9ek4P9w@mail.gmail.com>
	<20110514115341.6706c4f5@surf> <iqm18j$peg$1@dough.gmane.org>
	<20110514172642.3798873a@surf>
Message-ID: <BANLkTimvoX33kf8PtVJcNos90bGzdk7jYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 14, 2011 at 10:26 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 14 May 2011 13:49:07 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> > Soon, quite certainly not. Someday, maybe. But there's a lot of
>> > work to be done at the package infrastructure level to make this
>> > possible. It is not as simple as one might initially think to add
>> > this kind of features.
>>
>> I'm curious about this. ?I'm using ipkg and it works fine. ?Opkg seems
>> to be based on (and very similar to) ipkg. ?What is different about
>> opkg that makes it difficult?
>
> Maybe I misunderstood Xianghua initial request. I thought he was asking
> for Buildroot to generate ipkg/opkg packages, which Buildroot isn't
> capable of doing at the moment. If he is asking about having the
> opkg/ipkg-utils installed in a Buildroot system, then obviously it's
> fairly easy.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I never used ipkg/opkg on buildroot though I saw the package itself
there, can you do 'ipkg update/remove/install' reliably? i think it's
either fully-ipkg aware, or nothing, as using ipkg directly(acting
like a 'make install') may break things easily unless it's a
fully-ipkg-aware distribution.

Thanks,
