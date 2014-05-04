From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 11:20:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-03
In-Reply-To: <20140504063006.941AA101544@stock.ovh.net>
References: <20140504063006.941AA101544@stock.ovh.net>
Message-ID: <20140504092054.GA3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-04 08:30 +0200, Thomas Petazzoni spake thusly:
> Build statistics for 2014-05-03
> ===============================
> 
>         success : 27 
>        failures : 3  
>        timeouts : 0  
>           TOTAL : 30 

Woops.. Something went wrong with the autobiulders?

> Detail of failures
> ===================
> 
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/ff485236e0de26da0bb93fa2a7b0ea7207acd502/

I've tried to reproduce that one, but it built fine here.

What is strange is that the error is reproducible: there are at least
two build errors with the exact same message:

    collect2: error: ld terminated with signal 11 [Segmentation fault]

but it does not happen here, even in a Squeeze-32 chroot... :-(

IIRC, Gustavo was not able to rerproduce it either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
