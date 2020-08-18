From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 18 Aug 2020 07:18:34 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-08-17
In-Reply-To: <20200818075812.52A4F87590@hemlock.osuosl.org>
References: <20200818075812.52A4F87590@hemlock.osuosl.org>
Message-ID: <71f37fbc-e9a8-3cb8-b756-4f76073cb608@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/18/20 2:58 AM, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuild statistics for 2020-08-17
> ===================================
> 
>        branch |  OK | NOK | TIM | TOT |
>    2020.02.x  | 26  |  1  |  0  | 27  |
>    2020.05.x  | 17  |  5  |  0  | 22  |
>      master   | 149 | 63  |  0  | 212 |
>       next    | 38  | 22  |  0  | 60  |
> 
> Classification of failures by reason for master
> -----------------------------------------------
> 
>                ibm-sw-tpm2-1563 | 21
>                  qt5base-5.15.0 | 8

>     mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2848836c266777f519fa2eabef633285b67f86ac |
>    sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/12bb9aaea83f8f6abf4f2fc2465275e66278ee9a |
>    mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b50957c8948fc9074177c371f364f0fda278838f |
>    aarch64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/58eb80e58e9ad41e7f747719886110322375e905 |

Should be resolved by

http://patchwork.ozlabs.org/project/buildroot/patch/20200817192712.32481-1-vfazio at xes-inc.com/

> ================================
> 
> 

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
