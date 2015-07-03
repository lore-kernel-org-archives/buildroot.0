From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 00:04:09 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <5596EF6C.1020905@mind.be>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
 <5596EF6C.1020905@mind.be>
Message-ID: <20150703220409.GJ3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-07-03 22:24 +0200, Arnout Vandecappelle spake thusly:
> On 07/02/15 00:58, Petr Vorel wrote:
> > https://backports.wiki.kernel.org
> > 
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> > TODO: still don't know how to handle dependency on linux .config.
> 
>  It took me some time, but I finally understand what the issue is here...
> 
>  It's a bug in the kconfig infra.

No, it is not a bug, it is a feature.

I'm not kidding, Thomas DS. and I did that on-purpose; see my
explanations as a reply to your proposed patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
