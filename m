From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Dec 2012 22:45:53 +0100
Subject: [Buildroot] [PATCH 03/20] package/usbredir: new package
In-Reply-To: <87ip84isg2.fsf@dell.be.48ers.dk>
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <201212141401.11951.yann.morin.1998@free.fr>
 <87ip84isg2.fsf@dell.be.48ers.dk>
Message-ID: <201212142245.53802.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 14 December 2012 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> +comment "usbredir requires libusb"
>  Yann> +	depends on !BR2_PACKAGE_LIBUSB
>  Yann> +
>  >> 
>  >> We normally use select for libraries. Any reason to not use it here?
> 
>  Yann> libusb depends on threads, and I do not want to play the game of
>  Yann> inheriting the dependencies of my own dependencies, and reproduce
>  Yann> the libffi mess.
> 
>  Yann> libusb has a dependency I can not select, so I just depend on it.
[--SNIP--]
> I would prefer you select libusb.

Grudgingly done. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
