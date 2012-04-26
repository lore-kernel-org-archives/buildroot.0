From: Marc Gauthier <marc@tensilica.com>
Date: Wed, 25 Apr 2012 21:55:18 -0700
Subject: [Buildroot] [PATCH 22/22] xtensa: remove support for
	this	architecture
In-Reply-To: <20120425110914.523bffd1@skate>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <7fac2ee376eb5542ebd39c2eb063f773f99834a0.1334673910.git.thomas.petazzoni@free-electrons.com>
 <87pqawcia1.fsf@macbook.be.48ers.dk> <20120425110914.523bffd1@skate>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D0218B79413@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Le Wed, 25 Apr 2012 10:44:38 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
> > >>>>> "Thomas" == Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> writes:
> >
> >  Thomas> The support for Xtensa has been added in July
> >  Thomas> 2009, and no updates
> >  Thomas> have ever been done to it, and it requires some
> >  Thomas> special handling, in
> >  Thomas> gcc/gdb, has some special Perl scripts, etc.
> >
> > As discussed on IRC, I would prefer to simply mark Xtensa
> > as deprecated
> > for now, and then remove in the next cycle if nothing happens.
>
> I am fine with this decision, and will send a patch that
> implements it.
> My patch removing Xtensa support was mainly to get the discussion
> started.


Thanks for the reprieve.  How far is that "next cycle"?

-Marc
