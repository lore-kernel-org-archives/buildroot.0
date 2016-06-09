From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jun 2016 23:48:06 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <20160609233816.1a494a7a@free-electrons.com>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160609224203.599c50c1@free-electrons.com>
 <20160609211911.GC3826@free.fr>
 <20160609233816.1a494a7a@free-electrons.com>
Message-ID: <20160609214806.GE3826@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-09 23:38 +0200, Thomas Petazzoni spake thusly:
> On Thu, 9 Jun 2016 23:19:11 +0200, Yann E. MORIN wrote:
> > > This is a known bug in Kodi, which nobody has investigated so far.  
[--SNIP--]
> > So, unless we revise our position, the bug will stay. And it is a
> > Buildroot bug, not an upstream one.
> 
> It is and remains an upstream bug, there is absolutely no reason to
> not work with just .pyc/.pyo files.

What I meant was: given upstream position, the failure we observe at
runtime can be considered a Buildroot bug (although it technically is an
upstream bug, it is politicaly a Buildroot bug) ;-)

> However, since there has been apparently no movement on that side
> upstream, then let's just add the dependency that you suggested.

OK, I guess you meant have Kodi depends on .py files to be presetn (not
the other proposal to require .py files), right?

I'll cook up a patch.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
