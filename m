From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 6 Oct 2019 20:24:50 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-05
In-Reply-To: <20191006061752.B28AF2010A@silver.osuosl.org>
References: <20191006061752.B28AF2010A@silver.osuosl.org>
Message-ID: <20191006172450.GA2686@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Autobuild statistics for 2019-10-05
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  | 25  |  2  |  1  | 28  |
>   2019.05.x  | 24  |  1  |  0  | 25  |
>   2019.08.x  | 19  |  5  |  0  | 24  |
>     master   | 143 | 110 |  0  | 253 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------

...

>                    hostapd-2.9 | 1 

...

>   riscv64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/db6b3d03ec97ed7d9ce9eb40970fb3a1d46b6568 |     

...

The same issue as reported before. Should be fixed by:
https://patchwork.ozlabs.org/project/buildroot/list/?series=133060

Regards,
Sergey
