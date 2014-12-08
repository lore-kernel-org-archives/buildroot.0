From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 23:25:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
 eventfd_write()
In-Reply-To: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141208222547.GE4105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-24 22:43 +0200, Bernd Kuhls spake thusly:
> Needed for upcoming eventfd support in Kodi:
> https://github.com/FernetMenta/xbmc/commit/1030119691a67511b6e9a27abdec474525de8d26

As Peter said, we do not like to carry feature patches in Buildroot.

If Kodi really requires eventfd, we'll have to mark it incompatible with
uClibc in Buildroot. Kodi is already a big beast all by itself, so the
oversize of glibc would not be that noticeable when compared to Kodi.

Also, your use-case is a bit weird: you said you're using the fli4l
project to run Kodi on it. We failed to see the relation with Buildroot.

As such, we're marking this patch "Rejected" in Patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
