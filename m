From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 17:41:53 +0100
Subject: [Buildroot] [PATCH v7 1/4] sdl: add host version
In-Reply-To: <20140218171343.56bd9da1@skate>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-2-git-send-email-maxime.hadjinlian@gmail.com>
 <20140218171343.56bd9da1@skate>
Message-ID: <CAGduivzHg1S23FNp-F9=CqvbCh4PijnfDrXjRTGxxFNJVsR5Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 18, 2014 at 5:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Tue, 18 Feb 2014 00:37:10 +0100, Maxime Hadjinlian wrote:
>
>> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
>> index ba5fbca..bc48d35 100644
>> --- a/package/sdl/sdl.mk
>> +++ b/package/sdl/sdl.mk
>> @@ -18,8 +18,9 @@ define SDL_RUN_AUTOGEN
>>  endef
>>
>>  SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
>> -SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
>> +HOST_SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
>
> This should be a pre-configure hook, as we discussed recently on the
> list.
Argh. Forgot to change this...will do !
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
