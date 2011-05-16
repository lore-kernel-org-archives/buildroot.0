From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 16 May 2011 04:04:42 +0000 (UTC)
Subject: [Buildroot] package management
References: <BANLkTin3bxewdj6C5GYugDTt0Uu9ek4P9w@mail.gmail.com>
	<20110514115341.6706c4f5@surf> <iqm18j$peg$1@dough.gmane.org>
	<20110514172642.3798873a@surf>
	<BANLkTimvoX33kf8PtVJcNos90bGzdk7jYQ@mail.gmail.com>
Message-ID: <iqq7oq$lkd$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-05-14, Xianghua Xiao <xiaoxianghua@gmail.com> wrote:

>>> I'm curious about this. I'm using ipkg and it works fine. Opkg seems
>>> to be based on (and very similar to) ipkg. What is different about
>>> opkg that makes it difficult?
>>
>> Maybe I misunderstood Xianghua initial request. I thought he was
>> asking for Buildroot to generate ipkg/opkg packages, which Buildroot
>> isn't capable of doing at the moment. If he is asking about having
>> the opkg/ipkg-utils installed in a Buildroot system, then obviously
>> it's fairly easy.
>
> I never used ipkg/opkg on buildroot though I saw the package itself
> there, can you do 'ipkg update/remove/install' reliably?

Yes it works fine for all of the programs I've packaged.

> i think it's either fully-ipkg aware, or nothing, as using ipkg
> directly (acting like a 'make install') may break things easily
> unless it's a fully-ipkg-aware distribution.

Sorry, I don't know what that last sentence means.  I'll try again to
explain what is supported.

Buildroot does not produce .ipk files/packages.

Buildroot can build and install the ipackage utilities in the target
image.  Those ipackage utilties work fine on the target.  I use them
to install, update, and uninstall .ipk files I build outside of
buildroot.

-- 
Grant
