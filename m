From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 4 Feb 2020 15:40:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-02-03
In-Reply-To: <20200204071921.3A9EF2050F@silver.osuosl.org>
References: <20200204071921.3A9EF2050F@silver.osuosl.org>
Message-ID: <9b90047d-03f4-587d-579a-1c30e720734e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On 2/4/20 8:19 AM, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuild statistics for 2020-02-03
> ===============================
> 
>        branch |  OK | NOK | TIM | TOT |
>    2019.02.x  | 21  |  0  |  0  | 21  |
>    2019.11.x  | 18  |  2  |  0  | 20  |
>      master   | 95  | 136 |  0  | 231 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                   libnss-3.49.2 | 1

>    powerpc    |         libnss-3.49.2          | NOK | http://autobuild.buildroot.net/results/fb9e18f96e569d32e0bf7883dfbf2a7f72b7ee29 |

This is fixed by this patch:
https://patchwork.ozlabs.org/patch/1223060/

and added patch has already been upstreamed:
https://hg.mozilla.org/projects/nss/rev/f2d9478178505d24da34f2e694bdd05e0e6395c6

so we will see it in version 3.50

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
