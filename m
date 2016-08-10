From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 10 Aug 2016 09:58:49 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: new package
In-Reply-To: <20160809230509.512ae3b7@free-electrons.com>
References: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20160809224602.0cecd1a0@free-electrons.com>
 <181DFB1D-660A-45C8-80AE-9D768773B338@gmail.com>
 <20160809230509.512ae3b7@free-electrons.com>
Message-ID: <CAGduivwmXFwLQL+gy8aGjB8KvZpvEK=+rfTx9NcmP50iVSSz6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Tue, Aug 9, 2016 at 11:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 9 Aug 2016 14:01:02 -0700, Khem Raj wrote:
>
>> > FWIW, following a build failure on this package, I did a patch, which I
>> > submitted upstream. Here is the answer I got from upstream (more
>> > precisely Alexander Aring) :
>> >
>> > """
>> > Thanks for the patch, but this userspace software is unmaintained.
>> > You should use wpan-tools [0] which used nl802154, this is available
>> > since kernel 3.19.
>> >
>> > It's not recommended to use the stack in earlier kernel versions.
>> > We don't have a stable strategy yet (except extrem imporant fixed,
>> > root exploit, etc. :-))
>>
>> This is quite valuable feedback I believe. Helps you to decide
>> if you want to add a new package which is unmaintained and take
>> up maintaining it.
>
> On the other, not everyone may be able to use the latest nl802154
> stack, since it's available only since 3.19. So some people might be
> stuck using the older userspace tools.
Which is exactly my situation, thanks for the feedback though. I'll
keep it in mind when upgrading the kernel that we are using.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
