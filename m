From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 7 Mar 2015 13:26:02 +0100
Subject: [Buildroot] asm/errno.h: No such file or directory compiling
	luajit
In-Reply-To: <20150307130339.0dbc801c@free-electrons.com>
References: <CA+TH9Vn=OjM74WB46dgXXm3Xcjy5X6z8i++p8o6EK1vBs9xrxQ@mail.gmail.com>
 <20150306195416.62f7424b@free-electrons.com>
 <CA+TH9Vm09qBNY2qrykL1zTe5JmPmiRObfg_-K1juURVSjWwvZA@mail.gmail.com>
 <54FA4B00.4000901@mind.be>
 <CA+TH9Vk8eGbdW+X+NK=jkKeWRQO4MagfhU06P05HzP229zjDsQ@mail.gmail.com>
 <CA+TH9V=GWMch_yqBNcfvjXuW1oGWSgWEuvbwqtzTjQ-ptWVpzQ@mail.gmail.com>
 <20150307130339.0dbc801c@free-electrons.com>
Message-ID: <CA+TH9VkSZ0b3FuCPA5LHMFPetwCuz+cwu4HKfBCBQNuvCOV-QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-03-07 13:03 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Sat, 7 Mar 2015 12:44:04 +0100, Angelo Compagnucci wrote:
>
>> Making that link manually
>>
>> ln -s $PWD/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm
>> host/usr/include/asm
>
> Doing this is absolutely *horrible*. It's making host headers point to
> target headers. A recipe for disaster.
>
> Clearly not the right fix.

Yes, obviously, it was only an experiment to keep the build going to the end.
Unfortunately the problem remains, I have not an host/usr/include/asm
link in my host directory and I am eager to understand what's going
on.

Thank you for your time!

Sincerely, Angelo.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
