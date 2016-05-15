From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 May 2016 22:03:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160515215531.7824d583@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <20160514145905.GA3877@free.fr> <20160514160242.GB3877@free.fr>
 <20160515215531.7824d583@free-electrons.com>
Message-ID: <20160515200318.GE3877@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-15 21:55 +0200, Thomas Petazzoni spake thusly:
> On Sat, 14 May 2016 18:02:42 +0200, Yann E. MORIN wrote:
> > I've just run this config on my autobuilder, and the build was fine
> > (twice in a row, once with the machine already loaded, once with the
> > machine otherwise idle).
> > 
> > I'll do a few such builds in loop, just to see if the issue is
> > reproducible.
> 
> I think the issue is hard to reproduce: according to
> http://autobuild.buildroot.net/?reason=host-python3-3.4.3, it occurred
> only 15 times over the last 6 months, while I believe the host-python3
> package has been built hundreds to thousands of times.

Well, I was able to reproduce it at least twice on two different
machines (i.e. four times total, out of something like 30 builds),
provided they were otherwise highly loaded.

However, I am not sure we can easily do somehing about it. Disablign
parallel build is not nice, indeed. I can have a look to see if there is
something obvious in their buildsystem, but I can make no promise...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
