From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 15 Sep 2010 11:10:25 +0200
Subject: [Buildroot] [PATCH 04/21] automake: bump to 1.11.1
In-Reply-To: <AANLkTikUqL45y=t=eiTf8VuTgwC5TzxDThNK0i8UZkC_@mail.gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-4-git-send-email-Martin.Banky@gmail.com>
	<AANLkTimBfCzPQVFfX_TFNeLGqxD2umi=oHgFKUw93Au3@mail.gmail.com>
	<AANLkTikUqL45y=t=eiTf8VuTgwC5TzxDThNK0i8UZkC_@mail.gmail.com>
Message-ID: <AANLkTimHo5pfm8k5PPFFsXu3f5365wb9GcHX2FqZc9BY@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a first try here :

http://git.potipota.net/cgi-bin/cgit.cgi/buildroot/log/?h=new-libtool-at-work

It's based on libtool 2.2.6b, but I'm confident it will work with 2.2.10 too.
It's not finished and should not work very well with packages using
gettext with uclibc.
I've some more work done in private to handle this issue, I could
release it later today/night.

Regards,

--
Lionel Landwerlin

On Wed, Sep 15, 2010 at 4:58 AM, Martin Banky <Martin.Banky@gmail.com> wrote:
> Lionel,
> ???? Do you have a public repository that I could pull from or a patch set?
> I was just trying to upgrade libtool to 2.2.10, and am having issues. I'd
> like to not duplicate work if possible.
> Martin
>
> On Tue, Sep 14, 2010 at 1:51 AM, Lionel Landwerlin <llandwerlin@gmail.com>
> wrote:
>>
>> I'm still working on a new libtool version to be integrated in buildroot.
>> Amongst others things, automake 1.10.3 is required. So far I've been
>> able to build a rootfs including glib/libsoup/gstreamer/directfb with
>> automake 1.11, so...
>>
>> Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
>>
>> On Tue, Sep 14, 2010 at 5:40 AM, Martin Banky <martin.banky@gmail.com>
>> wrote:
>> > Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
>> > ---
>> > ?CHANGES ? ? ? ? ? ? ? ? ? ? ?| ? ?2 +-
>> > ?package/automake/automake.mk | ? ?2 +-
>> > ?2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/CHANGES b/CHANGES
>> > index 6abd5c0..381e628 100644
>> > --- a/CHANGES
>> > +++ b/CHANGES
>> > @@ -7,7 +7,7 @@
>> >
>> > ? ? ? ?Toolchain: ARM cortex A9 support
>> >
>> > - ? ? ? Updated/fixed packages: alsa-lib, alsa-utils, autoconf,
>> > + ? ? ? Updated/fixed packages: alsa-lib, alsa-utils, autoconf,
>> > automake,
>> > ? ? ? ?berkeleydb, busybox, dropbear, iptables, kismet, openvpn, qt,
>> > ? ? ? ?usbutils
>> >
>> > diff --git a/package/automake/automake.mk b/package/automake/automake.mk
>> > index 46bb773..a7d81ff 100644
>> > --- a/package/automake/automake.mk
>> > +++ b/package/automake/automake.mk
>> > @@ -3,7 +3,7 @@
>> > ?# automake
>> > ?#
>> > ?#############################################################
>> > -AUTOMAKE_VERSION = 1.10
>> > +AUTOMAKE_VERSION = 1.11.1
>> > ?AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
>> > ?AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>> >
>> > --
>> > 1.7.2.3
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
