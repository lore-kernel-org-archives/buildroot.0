From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 11 Oct 2019 22:53:18 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-10
In-Reply-To: <20191011061741.90207220D6@silver.osuosl.org>
References: <20191011061741.90207220D6@silver.osuosl.org>
Message-ID: <20191011195318.GA27779@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Autobuild statistics for 2019-10-10
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  | 24  |  1  |  0  | 25  |
>   2019.05.x  | 15  |  1  |  0  | 16  |
>   2019.08.x  | 14  |  5  |  0  | 19  |
>     master   | 132 | 104 |  1  | 237 |
> 

...

> Detail of failures
> ------------------
> 
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------

...

>     m68k     |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f880b1a430ebd6f97885103a622f1a4d9ec6de3a |     

This issue should be fixed by the second patch in the following series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=133060

Regards,
Sergey
