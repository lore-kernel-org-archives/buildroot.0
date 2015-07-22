From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 16:03:14 +0200
Subject: [Buildroot] [PATCH v8 1/1] Added linux drivers backports project
In-Reply-To: <1437519630-3674-1-git-send-email-petr.vorel@gmail.com>
References: <1437519630-3674-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150722140314.GA3777@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-07-22 01:00 +0200, Petr Vorel spake thusly:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> TODO: still don't know how to handle dependency on linux .config for
> target linux-backports-menuconfig.
> TODO: use kernel-module? IMHO not suitable for linux-backports.

So I've had a look at this new iteration of yours, and all the changes
you did I already had them in my version, plus more.

So I'll be using my version when re-spinning this in a moment.

Thank you for the hard work you've put in packaging this! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
