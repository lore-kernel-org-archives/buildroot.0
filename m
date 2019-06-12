From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 22:13:52 +0200
Subject: [Buildroot] Set up native build environment for kernel and
 application dev on target
In-Reply-To: <1560368655649-0.post@n4.nabble.com>
References: <1560368655649-0.post@n4.nabble.com>
Message-ID: <20190612201352.GG2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Bharat,
On 2019-06-12 14:44 -0500, bbacha spake thusly:
> Hi, I am trying to include a GCC or any other compatible toolchain in the
> target image. Also kernel headers for kernel module development. 
> Does buildroot generate image supporting native development on the target?

No, this is not supported, on purpose. See the explanations in the manual:
https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target

Regards,
Yann E. MORIN.

> Any help is appreciated.
> Processor: iMX8MQ (Cortex-A53)
> 
> Thanks,
> Bharat
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
