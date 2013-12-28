From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 20:50:39 +0100
Subject: [Buildroot] [PATCH 7/9] grub: really disable splash screen
 support
In-Reply-To: <1388242600-2580-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131228195039.GK3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 15:56 +0100, Thomas Petazzoni spake thusly:
> When BR2_TARGET_GRUB_SPLASH is enabled, we were passing
> --enable-graphics, but when it was disabled, we were not doing
> anything. However, in Grub, graphics support is enabled by default,
> and you have to pass --disable-graphics to disable it.
> 
> Fix this by passing --enable-graphics or --disable-graphics as
> appropriate.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
