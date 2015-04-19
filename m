From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 23:28:11 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <20150419211940.GD12734@t61>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
 <5533D5CF.5000305@mind.be> <20150419162839.GI4313@free.fr>
 <20150419190321.19200e70@free-electrons.com>
 <20150419211940.GD12734@t61>
Message-ID: <20150419212811.GN4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-04-19 23:19 +0200, Petr Vorel spake thusly:
> Thank you Thomas for testing, thanks a lot to all of you for the comments.
> Sorry that I didn't test it well, I didn't expect to be able to use 'make menuconfig'
> without calling make or 'make linux-backports' before.
> 
> I send v5 where I integrated Thomass' changes. So is it blind alley (if you don't want to
> tweak custom requirements), and I should try to add it as linux extension using
> integration strategy?

Well, I'm not even sure going with the integration strategy is doable
either.

From what I understand, the integration strategy works by cherry-picking
commits onto an earlier version, which requires a git tree, and we do
not use a git tree.

OTOH, the packaging strategy does not work currently for the previously
explained reasons.

I can have a further look into that, but it will take some time before I
can dedicate time to it...

Anyway, thank you for your continued efforts into getting support for
backports upstreamed! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
