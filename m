From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 May 2020 16:13:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-05-01
In-Reply-To: <20200502062833.CE3152049B@silver.osuosl.org>
References: <20200502062833.CE3152049B@silver.osuosl.org>
Message-ID: <b97e02a3-2929-d8db-415e-7756121ca69f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 02/05/2020 ? 08:28, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Autobuild statistics for 2020-05-01
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  | 28  | 16  |  0  | 44  |
>     master   | 209 | 139 |  0  | 348 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>              host-libsepol-3.0 | 9 
>              host-gnupg-1.4.23 | 4 
>               host-erlang-22.2 | 3 
>            host-nodejs-12.16.1 | 3 
>                host-efl-1.22.3 | 2 
>               host-grpc-1.25.0 | 2 
>              host-pango-1.44.6 | 2 
>              host-squashfs-4.4 | 2 

I've updated my autobuilder to Fedora 32 that use gcc 10 (prerelease).
Using gcc 10 trigger new issues related to the new default -fno-common:
https://gcc.gnu.org/gcc-10/porting_to.html

It seems too bleeding-edge for now :)

Best regards,
Romain
