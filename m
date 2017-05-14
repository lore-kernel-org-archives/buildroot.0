From: Mario Rugiero <mrugiero@gmail.com>
Date: Sun, 14 May 2017 01:24:10 -0300
Subject: [Buildroot] [PATCH] package: libcgi: set upstream to
	https://github.com/rafaelsteil/libcgi
In-Reply-To: <20170513145922.5e2626c5@free-electrons.com>
References: <20170512221546.20280-1-mrugiero@gmail.com>
 <20170513145922.5e2626c5@free-electrons.com>
Message-ID: <CAKKQwLRvWC34J-vJwuB2WO1m8a1UWLCukf8X+dOyUT0KAxtfkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's right, I should've checked.
There's an upstream computed sha256sum though, shouldn't that be in use?

2017-05-13 9:59 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri, 12 May 2017 19:15:46 -0300, Mario J. Rugiero wrote:
>> Also, bump to version 1.1 and cleanup. The patch is no longer needed.
>>
>> Tested with:
>> nitrogen6sx_defconfig
>>
>> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
>
> Thanks, but we already have a similar patch submitted, in
> https://patchwork.ozlabs.org/patch/757847/.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
