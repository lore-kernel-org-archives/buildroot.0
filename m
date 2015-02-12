From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Feb 2015 21:18:06 +0100
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <54DD055D.9080102@je-eigen-domein.nl>
References: <20150211175219.22579465@hebden.net.au>
 <20150212190940.GA4277@free.fr>
 <54DD055D.9080102@je-eigen-domein.nl>
Message-ID: <20150212201806.GB4277@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, James, All,

On 2015-02-12 20:56 +0100, Floris Bos spake thusly:
> On 02/12/2015 08:09 PM, Yann E. MORIN wrote:
[--SNIP--]
> >     (B.B.: it's a pity they are not yet bundling a bcmrpi2_defconfig in
> >     the Linux kernel tree...)
> 
> The Linux defconfig for the Pi 2 is called bcm2709_defconfig

Ah, nice. Thanks for the hint! :-)

James, since there is a defconfig in the Linux kernel, we prefer to use
it rather than bundle a custom defconfig.

Thanks!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
