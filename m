From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2012 21:49:59 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: bumpimg default GCC
	version to 4.6.3
In-Reply-To: <1354736519-18173-2-git-send-email-c.schoenert@t-online.de>
References: <1354736519-18173-1-git-send-email-c.schoenert@t-online.de>
 <1354736519-18173-2-git-send-email-c.schoenert@t-online.de>
Message-ID: <201212052149.59858.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carsten, All,

On Wednesday 05 December 2012 Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@t-online.de>
> 
> This bumps the GCC version from 4.4.6 to 4.6.3 to for
> *.config-eglibc
> *.config-glibc
> *.config-uClibc
> be equal to the default GCC setting in buildroot as well in addition to
> commit b855154ee8683e87afa08c6cc50b716d22879922.
> 
> Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Sigh, Peter was too fast applying your previous patch, I had no time to
review it, so I had no chance to ack it too. Thanks for doing the update.

No, Peter, that's not a pledge for you to stop applying patches fast! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
