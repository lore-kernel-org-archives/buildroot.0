From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 12:14:42 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <20150816100409.GD7325@sapphire.tkos.co.il>
References: <1439500078-22674-1-git-send-email-yann.morin.1998@free.fr>
 <20150814141516.GC25261@tarshish> <20150814144542.GC4017@free.fr>
 <20150816093510.GA3650@free.fr>
 <20150816100409.GD7325@sapphire.tkos.co.il>
Message-ID: <20150816101442.GC3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-16 13:04 +0300, Baruch Siach spake thusly:
> On Sun, Aug 16, 2015 at 11:35:10AM +0200, Yann E. MORIN wrote:
> > On 2015-08-14 16:45 +0200, Yann E. MORIN spake thusly:
> > > On 2015-08-14 17:15 +0300, Baruch Siach spake thusly:
> > > > On Thu, Aug 13, 2015 at 11:07:58PM +0200, Yann E. MORIN wrote:
> > > > > diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
> > > > > +sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
> > > > 
> > > > Why sha1?
> > >     http://sourceforge.net/projects/bwmng/files/bwmng/0.6/
> > Now that I think about it, we are no longer downloading from DF.net, but
> > directly from the new official location:
> >     http://www.gropp.org/?id=projects&sub=bwm-ng
> > 
> > And this new location does not provide a hash... :-(
> > 
> > But the file is also available on SF.net which provides this sha1.
> > 
> > So I wonder: should we point to the SF.net provided sha1, even though
> > we're not downloading from there?
> 
> Since the new bwm-ng website explicitly states that sf.net "will not be used 
> anymore", and provided the dubious reputation of sf.net as of late, I don't 
> think we can rely on their hashes in the long run, at least for this project. 
> I vote for locally computed sha256 in this case.

Ack, thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
