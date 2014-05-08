From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 00:25:00 +0200
Subject: [Buildroot] [PATCH] infra: indent the Config.in source-ing of
 packages
In-Reply-To: <1399584943-26869-1-git-send-email-arnout@mind.be>
References: <1399584943-26869-1-git-send-email-arnout@mind.be>
Message-ID: <20140508222500.GA18030@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-05-08 23:35 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This makes sure that a patch adding a package shows in which menu the
> package is added.

I thought we said we should split the big Config.in into smaller,
topic-related Config.in.TOPIC.

See this report from the Developpers' Day 2013:
    http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013

(Jumping in, as I was jsut thinking of doing that "one of those days"...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
