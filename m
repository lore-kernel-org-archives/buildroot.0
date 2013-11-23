From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2013 00:15:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-22
In-Reply-To: <52911255.3030207@openwide.fr>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <52911255.3030207@openwide.fr>
Message-ID: <20131123231542.GC3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2013-11-23 21:38 +0100, Romain Naour spake thusly:
> I tried to reproduce the following build failures:
> 
> powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/b6f619f9c249fc653dc65f0f516cb846683700bb/
> arm     |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/7e4/7e4e369dc5640619e95983ad0b4571f3a3f0d84b/
> (also on i686 last week...)
> 
> I have not been able to reproduce this error...

Neither was I.

The errors happen on Peter's build machine, which is a PPC.
Maybe something from the host is leaking in the build, and does leak
on neither your machine nor mine.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
