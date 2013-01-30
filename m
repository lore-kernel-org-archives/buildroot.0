From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 19:59:58 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <1358525515-7295-1-git-send-email-jezz@sysmic.org>
References: <20130118163104.441c2bfb@skate>
 <1358525515-7295-1-git-send-email-jezz@sysmic.org>
Message-ID: <201301301959.59342.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, Peter, All,

On Friday 18 January 2013 J?r?me Pouiller wrote:
> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
> handle them.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I've added this patch to my tree, as I need it to cleanly add new packages,
and it will be included in my next pull-request.

I'll add my *-by tags at the same time.

Thank you! :-)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
