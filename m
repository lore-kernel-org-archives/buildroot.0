From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jun 2013 18:49:04 +0200
Subject: [Buildroot] Randomization of kconfig choices?
In-Reply-To: <20130618093107.6c08e477@skate>
References: <20130618093107.6c08e477@skate>
Message-ID: <20130618164904.GB3952@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-18 09:31 +0200, Thomas Petazzoni spake thusly:
> I'm coming to the news regarding the randomization of kconfig choices?
> I know you've put a lot of efforts to try to fix this problem, but if I
> remember correctly so far the proposed solutions had some remaining
> issues.

No, I could not come up with a satisfiable solution so far. I've put it
a bit in a limbo, so I can start afresh from a new angle.

There have been some fixes in this area recently, but alas, none fixes
the randomisation of choices in presence of KCONFIG_ALLCONFIG.

But I was planning to work on this this week. Let's see where that will
get us...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
