From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 18:37:03 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 01/10] luainterpreter:
 create virtual package
In-Reply-To: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222173703.GB3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-11-15 14:07 +0100, Francois Perrad spake thusly:
> luainterpreter is lua or luajit

As you may have guessed from Thomas replies, I've been working with that
lua series of yours, and rebased it on-top of current master.

I also converted it to the new 'pacakge-defined providers' scheme for
virtual package, that we are switching to.

To avoid duplicated work, I'll apply all of Thomas suggestions I can
deal with, and will push the update series for you to take back and
reply to Thomas comments I did not address.

I'll get you posted when that's been done.

Note: I'm not really interested in lua, but I find it interesting we
have this infra applied. So, don't expect me to be too much active in
this series, besides this bump. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
