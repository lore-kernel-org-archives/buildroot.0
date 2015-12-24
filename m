From: Rodrigo Rebello <rprebello@gmail.com>
Date: Thu, 24 Dec 2015 09:11:42 -0200
Subject: [Buildroot] [PATCH v4 1/3] chocolate-doom: new package
In-Reply-To: <20151224082921.1e482c18@free-electrons.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
 <20151223233453.0e71a3b6@free-electrons.com>
 <CABLs7GUV97Ck5V6_vgmsCJfgxgvgZkkrvKvLeV8RX3RZK9+6Ug@mail.gmail.com>
 <20151224082921.1e482c18@free-electrons.com>
Message-ID: <CABLs7GWq4j7DPexG+-XnyMBocBJw-GDb2056erdGAWVNizYMpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2015-12-24 5:29 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Rodrigo Rebello,
>
> On Wed, 23 Dec 2015 22:33:01 -0200, Rodrigo Rebello wrote:
>
>> Agreed. I have considered exactly that when I was working on the
>> patch, but I have decided to leave it for later since a patch for
>> SDL_mixer is also necessary (SDL_mixer.pc is missing a 'Libs.private'
>> section with libraries necessary for static linking). I've just had a
>> look at it and the solution is actually quite simple, so I'll work on
>> it and propose a patch. That will also be useful to fix a recent ltris
>> autobuild failure related to static linking as well.
>
> Indeed, according to your description of the problem, it is really
> SDL_mixer.pc that needs to be fixed. However, if I looked correctly,
> chocolate-doom doesn't use pkg-config to find libraries, so it would
> have to be changed as well.
>

Yes, both SDL_mixer and chocolate-doom need patching. That's actually
what I meant in my previous email. I'll be working on that soon.

Regards,
Rodrigo

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
