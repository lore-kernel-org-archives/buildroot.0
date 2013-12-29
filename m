From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 23:11:17 +0100
Subject: [Buildroot] [PATCH 1/1] xenomai: fix build failure when
 HAVE_OPEN64 is undefined
In-Reply-To: <52C09BFF.1090706@openwide.fr>
References: <1388351123-16936-1-git-send-email-romain.naour@openwide.fr>
 <20131229212444.GN3567@free.fr> <52C09BFF.1090706@openwide.fr>
Message-ID: <20131229221117.GO3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2013-12-29 23:02 +0100, Romain Naour spake thusly:
> Le 29/12/2013 22:24, Yann E. MORIN a ?crit :
> >
> >It would be nice to say that this is an upstream patch, so it finds its
> >way into Buildroot quickly. ;-)
> >
> >Something like:
> >     Upstream patch:
> >     http://git.xenomai.org/xenomai-2.6.git/commit/?id=71345fe15f126ae3a596af309945d0af6edfbbbb
> 
> I did it with the previous patch on xenomai, but I forgot this time :-/
> I'll resend this patch with an updated commit log.

Thank you! Don't forget to add my acked-by! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
