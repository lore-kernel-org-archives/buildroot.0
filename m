From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 19:55:57 +0100
Subject: [Buildroot] [PATCH] BR2_EXTERNAL: check it is a valid
 BR2_EXTERNAL dir before using it
In-Reply-To: <1751679476.4596486.1390381240766.JavaMail.root@openwide.fr>
References: <1390338297-733-1-git-send-email-yann.morin.1998@free.fr>
 <1751679476.4596486.1390381240766.JavaMail.root@openwide.fr>
Message-ID: <20140122185557.GB3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2014-01-22 10:00 +0100, Jeremy Rosen spake thusly:
> ok, I tried your patch and I have a couple of problems
[--SNIP--]
> rosen at pcrosen:~/tmp/buildroot$ LANG=C make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
> Makefile:126: *** BR2_EXTERNAL='..' does not exist, relatively to /home/rosen/tmp/buildroot.  Stop.

OK, that one's fixed.

> Which is a confusing error message, the problem is that I don't have
> a Config.in and external.mk file  in tmp /(which are mandatory in
> BR2_EXTERNAL though that's not stated in the doc afaics)

Ah, right. They do be mandatory. I'll update the doc accordingly, so it
is explicit one has to provide both in an br2-external tree.

Thanks for the review and testing! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
