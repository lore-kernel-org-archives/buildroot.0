From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 00:05:46 +0200
Subject: [Buildroot] [PATCH WIP 15/16] xbmc: Bump version to Gotham_beta3
In-Reply-To: <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140331220546.GD5004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

Hihi! Gotham! :-)

On 2014-03-31 22:06 +0200, Bernd Kuhls spake thusly:
> - add support for uClibc, X.org, mesa3d, vaapi

For very large and complex beasts like XBMC, it would be better to
split the patch:
  - a first patch to bump
  - a second to add uClibc support
  - a third to add mesa3d
  - a fourth to add vaapi

This will make it easier to review.

As you said, we should consider this bump as an RFC: better wait for the
final release rather than bundle a beta release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
