From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2014 11:30:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <20140126073746.17723e9c@skate>
References: <20140109073009.A1897100CCB@stock.ovh.net>
 <20140109191427.GB3713@free.fr> <20140110072938.27628d13@skate>
 <20140111231717.GD3391@free.fr> <52D4E04B.7020700@mind.be>
 <20140126073746.17723e9c@skate>
Message-ID: <20140126103013.GB3517@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-26 07:37 +0100, Thomas Petazzoni spake thusly:
> On Tue, 14 Jan 2014 07:59:23 +0100, Arnout Vandecappelle wrote:
> > > I really don't know what is best to do. I think I'll do the above and
> > > try to get the patch upstreamed. Let's see what hey think about it.
> > 
> >   What should definitely be upstreamable, is to add a cache variable for 
> > this option. Then we can set the cache variable from buildroot like we do 
> > for so many other things already.
> 
> Yes, that is usually the right solution for this type of problem. It
> allows to tell configure that we know what we're doing :-)

Yes. This has been upstreamed now (albeit slightly differently from the
patch we carry in Buildroot).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
