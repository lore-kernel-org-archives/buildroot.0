From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Aug 2019 19:28:17 +0200
Subject: [Buildroot] Various runtime test failures on Gitlab CI
In-Reply-To: <20190810170121.GJ21314@scaer>
References: <20190810151945.5ed664ea@windsurf.home>
 <20190810135216.GI21314@scaer> <20190810170121.GJ21314@scaer>
Message-ID: <20190810172817.GK21314@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2019-08-10 19:01 +0200, Yann E. MORIN spake thusly:
> On 2019-08-10 15:52 +0200, Yann E. MORIN spake thusly:
> > On 2019-08-10 15:19 +0200, Thomas Petazzoni spake thusly:
> > >  - For tests.init.test_systemd.TestInitSystemSystemdRwFull, we're
> > >    getting:
[--SNIP--]
> > > SystemError: System does not boot
> > This one works OK here:
[--SNIP--]
> I was however able to reproduce a similar issue with another runtime
> test, tests.init.test_systemd.TestInitSystemSystemdRwNetworkd which
> failed because it too was unable to find ttyAMA0...

And restarting it again no longer fails...

So, it really is a timing issue, it seems. Meh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
