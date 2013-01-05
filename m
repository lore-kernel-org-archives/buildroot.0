From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jan 2013 22:57:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-01-03
In-Reply-To: <8738yhnsus.fsf@dell.be.48ers.dk>
References: <20130104073440.E230952C0FD@lolut.humanoidz.org>
 <8738yhnsus.fsf@dell.be.48ers.dk>
Message-ID: <201301052257.57485.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Friday 04 January 2013 Peter Korsgaard wrote:
>  Thomas> Status         : NOK
>  Thomas> Failure reason : tvheadend-v3.3
>  Thomas> Architecture   : i686
>  Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>  Thomas> Submitted at   : 2013-01-03 00:13:22
>  Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d946a1af93741a7ae22ec69be865a6c14a37fcf1
>  Thomas> End of log     : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/build-end.log
>  Thomas> Complete log   : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/build.log.bz2
>  Thomas> Configuration  : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/config
>  Thomas> Defconfig      : http://autobuild.buildroot.net/results/fe25485bde8894daff5bdf806eb4bb2fa776dc55/defconfig
> 
> Yann, it looks like we should patch out the -Werror from the
> Makefile. Care to take a look?

There's a patch upstream that fixes this. I'll backport it rather than
disable -Werror.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
