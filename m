From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Mar 2014 22:41:34 +0100
Subject: [Buildroot] [lua V3 4/8] luajit: add host variant
In-Reply-To: <20140301193910.369c3cdd@skate>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
 <1393694590-29945-5-git-send-email-francois.perrad@gadz.org>
 <20140301174721.GB3354@free.fr> <20140301193910.369c3cdd@skate>
Message-ID: <20140301214134.GF3354@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-01 19:39 +0100, Thomas Petazzoni spake thusly:
> On Sat, 1 Mar 2014 18:47:21 +0100, Yann E. MORIN wrote:
> > I'm really worried about how this is gonna play with the virtual-package
> > insfrastructure curently pending.
[--SNIP--]
> While in general I prefer to merge things as soon as possible, and then
> improve on top of it later on, in this case, I believe it would be nice
> if the virtual package infra could from the beginning support the host
> package case since we know we will need it for the Lua stuff.
> 
> Yann, you could just test it with some simple dummy host packages to
> ensure that your virtual infra works for host packages, and leave it to
> Fran?ois to rebase his series on top of the infra once it has been
> merged.
> 
> How does it sounds?

I already thought about this. But writing a host virtual package that
actually makes sense is not so easy. But I can try to do so...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
