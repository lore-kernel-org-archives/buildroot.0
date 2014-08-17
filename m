From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 11:51:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-08-16
In-Reply-To: <20140817091313.GB5274@free.fr>
References: <20140817063010.1E5C3100D11@stock.ovh.net>
 <20140817101620.00dae1a7@free-electrons.com>
 <20140817091313.GB5274@free.fr>
Message-ID: <20140817095103.GC5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-17 11:13 +0200, Yann E. MORIN spake thusly:
> On 2014-08-17 10:16 +0200, Thomas Petazzoni spake thusly:
> > Quick analysis of the build failures of the day.
> > >        arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/
> > 
> > Probably not too difficult to investigate:
> > 
> > /usr/bin/install: cannot create regular file `/scratch/peko/target/etc/upsmon.conf.sample': File exists

Parallel build issue, fix found, testing in progress...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
