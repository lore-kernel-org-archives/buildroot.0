From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 Jul 2015 08:41:05 +0200
Subject: [Buildroot] [PATCH v8 1/1] Added linux drivers backports project
In-Reply-To: <20150722052818.GA4041@free.fr>
References: <1437519630-3674-1-git-send-email-petr.vorel@gmail.com>
 <20150722052818.GA4041@free.fr>
Message-ID: <20150722064103.GA3243@vorel-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann and all,

> As I said in my previous mail, I have adopted this patch. It means I
> did some changes to it locally, notably bump to 4.1.1-1 and solve
> the configury dependency, see my branch:
>     http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/linux-backports
> 
> I was about to send it yesterday evening/night, but I was really
> exhausted after a long working day, so I post-poned the respin to avoid
> mishaps due to tiredness. ;-) I'll probably send it this evening when
> I'm back home (UTC+2).
Not a problem, the main concern is to get work done :-).
I see it really helped to use kernel-module, I read these patches some
time ago and I didn't understand they're suitable for backports.

> As for the configury stuff, it will need another patch to be applied
> first, to fix a breakage in the pkg-kconfig infra (my bad!), see:
>     https://patchwork.ozlabs.org/patch/498333/
Great you solve linux config dependency problem.
Btw, there is a typo in " stamp-like file wihch path" => which

Kind regards,
Petr
