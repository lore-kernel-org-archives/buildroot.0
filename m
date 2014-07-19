From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 11:17:42 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKbkwub=5WV6Uq7D=byqTpjrR=HP5dQW5P82=rsNdf4p7g@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140718213550.GG3630@free.fr>
 <CAJtjsKbkwub=5WV6Uq7D=byqTpjrR=HP5dQW5P82=rsNdf4p7g@mail.gmail.com>
Message-ID: <20140719091741.GA3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-07-19 01:58 +0200, Johan Oudinet spake thusly:
> Thanks Yann for the comments.
> I'm on holidays for the next 2 weeks, but I will take care of them as
> soon as I'm back.

Enjoy your holidays! :-)

> In the meantime, I'm interested in how to set file permissions without
> knowing which uid/gid ejabberd user has?
> Can I use user/group names instead of IDs in EJABBERD_PERMISSIONS syntax?

Just -1 as uid or gid. See:
    http://buildroot.net/downloads/manual/manual.html#makeuser-syntax

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
