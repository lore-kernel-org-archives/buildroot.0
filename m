From: Marc Lindahl <marc@bowery.com>
Date: Mon, 6 Nov 2006 16:13:14 -0500
Subject: [Buildroot] Suggestion, Keep version in a separate file.
In-Reply-To: <LS3rmy351Zd4.Fk5h2M9g@mailout.dof.se>
References: <LS3rmy351Zd4.Fk5h2M9g@mailout.dof.se>
Message-ID: <e1b81b87c9e7517e2c7b7a077f8b1bba@bowery.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That sounds like it would make the buildroot system overly complicated 
for an rare edge case.
You can do that by managing your .config files - many ways to do that 
already....

On Nov 6, 2006, at 3:29 PM, Ulf Samuelsson wrote:

>
> I believe it would be a good
> idea to separate the version
> info and download site
> from the <package>.mk.
> and keep a central file
> with this info.
>
> This would make it easier
> to handle several projects
> using different versions
> of packages with the same
> framework.
> As part of this I think patches
> to packages should reside
> in a subdirectory to the
> main package directory.
>
> /Ulf
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
