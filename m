From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 14:19:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <CAB0FRstzCmA3=7w_KrLZ=5fATHWo6fKzsfk4ok_JLQuzh=bdag@mail.gmail.com>
References: <20140609063010.9CF93101624@stock.ovh.net>
 <20140609100709.GA3512@free.fr>
 <CAB0FRstzCmA3=7w_KrLZ=5fATHWo6fKzsfk4ok_JLQuzh=bdag@mail.gmail.com>
Message-ID: <20140609121945.GC3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-06-09 14:04 +0200, Fran?ois Perrad spake thusly:
> 2014-06-09 12:07 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > On 2014-06-09 08:30 +0200, Thomas Petazzoni spake thusly:
> >>     xtensa |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/511193d2c43ced35fada333c8b2d13a7f096fb10/
> >
> > Did something change in the luarocks infra ?
> >     gzip: cosmo-14.03.04.tar.gz: not in gzip format
> >     tar: This does not look like a tar archive
> >     tar: Exiting with failure status due to previous errors
> >
> > Fran?ois ?
> 
> No change with luarocks infra, just a problem with a rock.
> I've notified this problem to the LuaRocks mailing list,
> see http://sourceforge.net/p/luarocks/mailman/message/32431219/

OK, good. Thanks for the feedback! :-)

Should we do something special in the meantime, like disabling cosmo in
the menuconfig?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
