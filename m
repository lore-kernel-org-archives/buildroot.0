From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 00:17:01 +0200
Subject: [Buildroot] [PATCH] system: sysvinit needs MMU
In-Reply-To: <20e20bf5-1a43-374a-f2c7-646c6d63a919@mind.be>
References: <1471107441-15881-1-git-send-email-yann.morin.1998@free.fr>
 <20e20bf5-1a43-374a-f2c7-646c6d63a919@mind.be>
Message-ID: <20160814221701.GJ30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-15 00:09 +0200, Arnout Vandecappelle spake thusly:
> On 13-08-16 18:57, Yann E. MORIN wrote:
> > It uses spawn() and thus fork(), so it needs an MMU.
> 
>  spawn() is defined by sysvinit itself, so it doesn't make much sense to mention
> that here.

Indeed...

>  Otherwise:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Already applied... But thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
