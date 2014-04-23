From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Apr 2014 19:42:05 +0200
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <20131111215435.GC3510@free.fr>
References: <20131111215435.GC3510@free.fr>
Message-ID: <20140423174205.GA3183@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2013-11-11 22:54 +0100, Yann E. MORIN spake thusly:
[--SNIP--]
> We would like to suggest that the web GUI and the pwclient CLI both
> display such tags besides each patch, a bit like (hypotetical output of
> pwclient):
> 
>     ID     Tags State       Subject
>     123456 ART  New         Wonderfull patch to apply quickly
> 
> Where each of 'A', 'R', and 'T' would mean Acked-by, Reviewed-by and
> Tested-by, respectively. An uppercase letter would mean two of more of
> such tag, while a lower-case letter would mean a single such tag.

Any progress on this?

I've tried doing so myself, but my two attempts lamentably failed... :-(
Any one with Python- and SQL-fuu willing to have a look?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
