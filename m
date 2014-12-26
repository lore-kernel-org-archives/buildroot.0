From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 11:27:16 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-12-25
In-Reply-To: <20141226073018.703E2101276@stock.ovh.net>
References: <20141226073018.703E2101276@stock.ovh.net>
Message-ID: <20141226102716.GB3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-26 08:30 +0100, Thomas Petazzoni spake thusly:
> f2fs-tools-baac4b4e6f41ceb0... | 18

Should be fixed by:
    http://patchwork.ozlabs.org/patch/424061/

>                   guile-2.0.11 | 12

We have prelimiary patches required before we can eventually investigate
those build failures:
    http://patchwork.ozlabs.org/patch/423997/
    http://patchwork.ozlabs.org/patch/423998/

>                      ntp-4.2.8 | 6 

Should be fixed by:
    http://patchwork.ozlabs.org/patch/424067/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
