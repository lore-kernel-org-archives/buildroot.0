From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Nov 2013 23:30:25 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <528BE378.7030107@mind.be>
References: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
 <528BE378.7030107@mind.be>
Message-ID: <20131119223024.GB3422@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-11-19 23:17 +0100, Arnout Vandecappelle spake thusly:
>  The <PKG>_USERS definition doesn't support comments,

Yes, it does. Whatever comes as field #9 and after is treated as the
comment. See:
    http://buildroot.net/downloads/manual/manual.html#makeuser-syntax

But granted, without the *real* helloworld.mk and the *real* Config.in
(as Thomas has asked for), we can't do much to help... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
