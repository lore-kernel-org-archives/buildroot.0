From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 23:40:01 +0200
Subject: [Buildroot] [PATCH] support/check-uniq-files: support weird
 locales and filenames
In-Reply-To: <687416b0-f536-d0cc-6761-503180faad2e@jcz.nl>
References: <20180331125250.19374-1-yann.morin.1998@free.fr>
 <3de992aa-48b0-e4ae-1122-fc4e3f409aed@mind.be>
 <687416b0-f536-d0cc-6761-503180faad2e@jcz.nl>
Message-ID: <20180401214001.GQ2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap, All,

On 2018-04-01 23:25 +0200, Jaap Crezee spake thusly:
> On 03/31/18 15:37, Arnout Vandecappelle wrote:
> >> Reported-by: Jaap Crezee <jaap@jcz.nl>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >> Cc: Jaap Crezee <jaap@jcz.nl>
> >  Applied to master, thanks. But I couldn't resist extended the commit log a
> > little more - it really was too short :-P
> Excellent guys, thank you.
> I can confirm it works for me.

OK, good to know, thanks for the feedback. :-)

> Are such patches expected to be applied to/merged on 2018.02.x as well?

Yeah, they will eventually trickle down to the LTS branch. But we
presumably want to test-bench them a bit in master before doing the
backport...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
