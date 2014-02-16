From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 21:57:27 +0100
Subject: [Buildroot] [PATCH v6 4/4] xbmc: new package
In-Reply-To: <f8ef4090-214d-48a3-ae77-b96a198a527a@email.android.com>
References: <1392557273-3522-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392557273-3522-5-git-send-email-maxime.hadjinlian@gmail.com>
 <f8ef4090-214d-48a3-ae77-b96a198a527a@email.android.com>
Message-ID: <20140216205727.GF3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Amxime, All,

On 2014-02-16 20:55 +0100, Thomas De Schampheleire spake thusly:
> Maxime Hadjinlian <maxime.hadjinlian@gmail.com> schreef:
[--SNIP--]
> >+config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
> >+	bool "libshairport"
> >+	select BR2_PACKAGE_LIBSHAIRPLAY
> >+	depends on BR2_INET_IPV6
> >+	help
> >+	  Enable shairport support.
> >+	  Select this if you want to stream content from Apple device.
> 
> an Apple device

Or:  Apple devices.  (plural).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
