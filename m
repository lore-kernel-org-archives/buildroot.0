From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Oct 2013 22:38:13 +0200
Subject: [Buildroot] [PATCH] pakage/rpi-userland: add and install our
	bcm_host.pc
In-Reply-To: <87wqlqdyob.fsf@dell.be.48ers.dk>
References: <1381011437-7113-1-git-send-email-yann.morin.1998@free.fr>
 <87wqlqdyob.fsf@dell.be.48ers.dk>
Message-ID: <20131006203813.GB5308@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-10-06 20:47 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> This allows pkg-config-aware packages to include headers from, and
>  Yann> link against Broadcom VideoCore host API library.
> 
>  Yann> bcm_host.pc copied almost as-is from:
>  Yann>     http://cgit.collabora.com/git/user/pq/android-pc-files.git/tree/pkgconfig?h=raspberrypi
>  Yann> with only a fix to the prefix (we're using /usr).
> 
>  Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> It installs into staging so it should be
> RPI_USERLAND_POST_INSTALL_STAGING_HOOKS.

Doh.. Stupid me... :-/

> Committed with that fixed, thanks.

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
