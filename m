From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 07:35:01 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <20150721220108.GA1183@t61>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
 <20150719132950.GC4020@free.fr> <20150721220108.GA1183@t61>
Message-ID: <20150722053501.GB4041@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-07-22 00:01 +0200, Petr Vorel spake thusly:
> > Since there's quite some work left to be done, and we would like to have
> > this as part of the next release, I'm adopting this patch to fix the
> > remaining issues that Arnout and I raised earlier.
> 
> I'm sorry, it took me a bit longer to reply, I was on holiday in the
> mountains, without the internet.

Lucky you! :-)

> IMHO the main problem is linux-configure dependency - I wasn't able to
> trigger it. The rest should be easy to fix. I'll write a quick note to the other posts.

Yup, I did solve the configury dependency. It was indeed not trivial,
but most importantly, it uncovered an issue within the pkg-kconfig
infra, that had to be fixed first (see my reply to your other mail).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
