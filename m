From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 16:25:47 +0100
Subject: [Buildroot] [PATCH v7 33/33]
 package/libemotion-generic-players: new package
In-Reply-To: <20151208142734.GM4188@free.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-34-git-send-email-romain.naour@openwide.fr>
 <20151208142734.GM4188@free.fr>
Message-ID: <20151208152547.GN4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-08 15:27 +0100, Yann E. MORIN spake thusly:
> On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> I'll just try another biuld-test, with no X11 support but with full
> OpenGL (see my comments in the GL patch).

OK, that build is working fine...

Still, it does not, IMHO, make sense to enable full OpenGL support when
EFL does not have X11 support to begin with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
