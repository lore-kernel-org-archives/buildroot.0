From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 5 Apr 2020 13:57:15 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-04-04
In-Reply-To: <20200405062746.3ECF185F75@fraxinus.osuosl.org>
References: <20200405062746.3ECF185F75@fraxinus.osuosl.org>
Message-ID: <20200405105715.GA2143@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 05, 2020 at 06:27:40AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuild statistics for 2020-04-04
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  |  8  |  0  |  0  |  8  |
>   2019.11.x  | 12  |  0  |  0  | 12  |
>   2020.02.x  | 17  |  3  |  0  | 20  |
>     master   | 138 | 58  |  0  | 196 |


Hello Thomas,

Today I received two bug reports for orange-pi-one and macchiatobin boards.
In both cases the reason of failure is 'No space left on device'. I randomly
picked several other board failures and the reason seems to be the same.

Regards,
Sergey
