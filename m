From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu, 30 Aug 2018 08:05:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-29
In-Reply-To: <20180830060015.669EF207B1@mail.bootlin.com>
References: <20180830060015.669EF207B1@mail.bootlin.com>
Message-ID: <20180830080555.07ca07ec@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On Thu, 30 Aug 2018 08:00:15 +0200 (CEST)
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build statistics for 2018-08-29
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  26 |   0 |   1 |  27 |
>    2018.05.x |  19 |   0 |   0 |  19 |
>       master | 196 |   7 |   0 | 203 |
>         next |  21 |  46 |   0 |  67 |
> 
[...]
> 
> Results for branch 'next'
> =========================
> 
> Classification of failures by reason
> ------------------------------------
> 
[...]
>       libusbgx-libusbgx-v0.2.0 | 1 
[...]
> 
> Detail of failures
> ------------------
> 
[...]
> | arm |       libusbgx-libusbgx-v0.2.0 | NOK |
> http://autobuild.buildroot.net/results/2add25597dc722abcd7ea8784e023ed3c4567afe
[...] 
> -- 
> http://autobuild.buildroot.net

Fixed by http://patchwork.ozlabs.org/patch/960986/

Gwen
