From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Mar 2014 12:04:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-07
In-Reply-To: <20140308073007.50AAF1016F2@stock.ovh.net>
References: <20140308073007.50AAF1016F2@stock.ovh.net>
Message-ID: <20140308110454.GA3254@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-08 08:30 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
> ===================
> 
>       i686 |   CXX      Source/JavaScrip... | TIM | http://autobuild.buildroot.net/results/93a3e226f624bc389ad647014c070b66ac83de57/

This one had been running for 12663 seconds, which is 3h 31min 3s at the
moment it _started_ building webkit.

So, it looks like some of the random builds can run for more than the
limit of 4h.

Of course, I'm not saying we should bump the limit. But this is a good
example of why saving build-time.log is useful! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
