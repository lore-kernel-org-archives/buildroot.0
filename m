From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:37:52 +0100
Subject: [Buildroot] [PATCH 04/13] docs/manual: reference Python and Lua
 infras from the list of package infrastructures
In-Reply-To: <20140223152957.GF3342@free.fr>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140223152957.GF3342@free.fr>
Message-ID: <20140223163752.7964f79d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 23 Feb 2014 16:29:57 +0100, Yann E. MORIN wrote:

> > +* *Makefiles for Python modules*: We have a dedicated infrastructure
> > +   for Python modules that use either the +distutils+ or the
> > +   +setuptools+ mechanism. We cover them through a
> > +   xref:python-package-tutorial[tutorial] and
> > +   xref:python-package-reference[reference].
> 
> I believe english grammar mandates the following:
>     [...] a tutorial and a reference.
> 
> So, you're missing an 'a' between the 'and' and the 'reference'.

Ok. I'll see if Peter applies the patch and makes the change himself
before resending 13 patches :-)

> Also, what about the mandatory status of this? For other package
> onfrastructures, we say:
>     This infrastructure must be used for new packages that rely on [XXX]
>     as their build system.
> 
> Why don't we add this for Python modules?

I found it quite redundant, and in fact I believe it is now a bit
useless even for autotools and cmake packages. It used to be useful at
the time we had old-style packages that were not yet converted. But
nowadays, it is quite clear that if the package infrastructure exists
and matches the build system of a given package, then it must be used.

Thanks a lot for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
