From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 18:51:39 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <CA+wH296eA55hCFSpuuX8TVDhxt7EpnVmAT0p5ciV39x_qZnW-Q@mail.gmail.com>
References: <50F6A26D.4030607@petroprogram.com>
 <20130117000037.39ccc628@skate> <50F74776.60503@petroprogram.com>
 <20130117093159.2d46ecfd@skate> <50F8019C.4000003@petroprogram.com>
 <CA+wH296eA55hCFSpuuX8TVDhxt7EpnVmAT0p5ciV39x_qZnW-Q@mail.gmail.com>
Message-ID: <50F82C1B.2040709@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex!

17.1.2013 18:18, Alex Bradbury kirjoitti:
> On 17 January 2013 13:50, Stefan Fr?berg
> <stefan.froberg@petroprogram.com> wrote:
>> And if even *that* is not enought then I could consider maybe switching
>> to musl ... maybe ...
> I've been following musl for a while - it really might be worth giving
> a go. They're aiming to be more lightweight than Glibc, while more
> functional than uclibc. Plus some musl patches for buildroot and
> crosstool-ng would be kind of awesome ;)
>
> Alex

Is it true that musl supports (at least most) of the glibc ABI ?
(my biggest worry so far when using uClibc is that I encounter an
application that is provided as glibc-only
binary and no source code provided.)

What about it's configuration ? Does it have nice kconf style  "make
menuconfig" like uClibc or what ?

Stefan
