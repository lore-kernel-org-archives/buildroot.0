From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jul 2016 22:23:26 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
	headers >= 3.11
In-Reply-To: <87eg709ccd.fsf@dell.be.48ers.dk>
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
 <87eg709ccd.fsf@dell.be.48ers.dk>
Message-ID: <20160711202325.GB5122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-07-11 21:57 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > ... since it uses O_TMPFILE as an open(2) flag, and it was only
>  > introduced in 3.11.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Gabe Evans <gabe@hashrabbit.co>
>  > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Committed, thanks.

Had you seen the other patch a bit later, with comments from Thomas,
before applying this one?

https://patchwork.ozlabs.org/patch/646796/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
