From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 29 Jul 2019 15:33:05 +0200
Subject: [Buildroot] [PATCH] board/armadeus: bump apf51 kernel to 4.4.30
 (latest LTS)
In-Reply-To: <20190726163121.0d823249@windsurf>
References: <1478531682-6181-1-git-send-email-julien.boibessot@free.fr>
 <20190726163121.0d823249@windsurf>
Message-ID: <8ebb0c3f-af0c-4a39-b2d1-955ee8f14188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 26/07/2019 16:31, Thomas Petazzoni wrote:
> Hello Julien,
>
> On Mon,  7 Nov 2016 16:14:42 +0100
> julien.boibessot at free.fr wrote:
>
>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> This will fix:
>> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf51_defconfig.log.FAIL
>>
>> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> This defconfig no longer builds properly, due to gcc 8.x being used:
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/259847033
>
> The actual error is:
>
> /tmp/ccpM4tIY.s: Assembler messages:
> /tmp/ccpM4tIY.s:1908: Error: .err encountered
> /tmp/ccpM4tIY.s:2914: Error: .err encountered
> scripts/Makefile.build:258: recipe for target 'drivers/input/evdev.o' failed
>
> It might be fixed in a later 4.4.x kernel, otherwise you'll have to
> bump to a newer kernel version.
>
> Could you have a look and send a patch for this ?

Done !

Thank you for reporting the problem.

Best regards,

Julien
