From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 9 Dec 2008 11:34:28 -0200
Subject: [Buildroot] [PATCH 0/7] add Phonon support to qtopia4
In-Reply-To: <20081209114501.247dc1dc@hcegtvedt>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200812082300.09891.markus.heidelberg@web.de>
	<20081209070242.00734379@hcegtvedt>
	<200812091135.00129.markus.heidelberg@web.de>
	<20081209114501.247dc1dc@hcegtvedt>
Message-ID: <d6cda7730812090534s48450a29v37fb0a84b487aa47@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> > The reason playback is so slow is that you are probably not using
>> > the pixel coprocessor (PICO) to do the work. That was why getting
>> > gst-ffmpeg (libavcodec) with the AVR32 patches to work would be very
>> > nice.
>>
>> This optimization with using the PICO should also be possible for Qt
>> output, independent of video playback, shouldn't it?
>>
>
> No, you will have to write optimized assembly to take advantage of the
> PICO. Qt does not use the PICO by default, not even DSP or SIMD
> instructions.
>

Isn't DirectFB optimized? Qt has a DirectFB output plugin since 4.4 if
I'm not mistaken. It as a labs feature (labs.trolltech.com) that got
integrated into mainline. I guess it's not enabled in buildroot builds
yet though.

Kind Regards,
    Thiago A Correa.
