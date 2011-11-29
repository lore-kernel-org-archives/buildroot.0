From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 29 Nov 2011 22:28:34 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.3
In-Reply-To: <CAGm1_kuxra-K_A3nEGd0qG6s=s5-qzvq8XVGL+5akJNqVozhpg@mail.gmail.com>
References: <1322584033-19870-1-git-send-email-zonque@gmail.com>
 <CAGm1_kuxra-K_A3nEGd0qG6s=s5-qzvq8XVGL+5akJNqVozhpg@mail.gmail.com>
Message-ID: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 29, 2011 at 10:26 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, Nov 29, 2011 at 5:27 PM, Daniel Mack <zonque@gmail.com> wrote:
>> This newer version splits the library code into libnl, libnl-route,
>> libnl-genl and libnl-nf, each individually selectable via pkgconfig.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> ---
>> ?package/libnl/libnl.mk | ? ?2 +-
>> ?1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
>> index dd0d7fb..612908b 100644
>> --- a/package/libnl/libnl.mk
>> +++ b/package/libnl/libnl.mk
>> @@ -4,7 +4,7 @@
>> ?#
>> ?#############################################################
>>
>> -LIBNL_VERSION = 3.0
>> +LIBNL_VERSION = 3.2.3
>> ?LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
>> ?LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
>> ?LIBNL_INSTALL_STAGING = YES
>> --
>> 1.7.7.3
>
> The only package I know that is prepared for libnl 3.2.3 is iw (latest
> git version). Other packages like wpa_supplicant, hostapd, kismet are
> not prepared for the new version of libnl.

I've seen your patches for wpa_supplicant, hostapd. So kismet and iw are left.

Yegor
