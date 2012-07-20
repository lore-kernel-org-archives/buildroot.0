From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Fri, 20 Jul 2012 17:55:59 -0400 (EDT)
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <20120720155807.GA10741@mail.sceen.net>
Message-ID: <1420285564.1717356.1342821359539.JavaMail.root@mail.savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> On Fri, Jul 20, 2012 at 11:34:44AM -0400, ?meric Vigier wrote:
> > Your patch makes -reconfigure clean-for-rebuild and then (just)
> > -configure, without rebuilding.
> > That's ok to me, but you have to choose between:
> > 
> > 1. updating docs/manual/rebuilding-packages.txt accordingly,
> > especially:
> > "For convenience, most packages support the special make targets
> > <package>-reconfigure and <package>-rebuild to repeat the configure
> > and build steps"
> 
> I may misunderstand what you mean, because, when reading this part, I
> understand that "-reconfigure and -rebuild" "repeat the configure and
> build steps". It may lack a formal "respectively", but other than
> that,
> it's exactly what my patch does by calling only -configure.

Indeed respectively is missing.

> 
> --
> Richard Braun
> 

-- 
Emeric
