From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 8 Jun 2017 21:44:52 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170607212720.GA23160@scaer>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com>
 <20170607212720.GA23160@scaer>
Message-ID: <20170608194451.GT26922@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> Waldemar, Thomas, All,
> 
> On 2017-06-06 21:35 +0200, Thomas Petazzoni spake thusly:
> > On Tue, 6 Jun 2017 19:56:59 +0200, Waldemar Brodkorb wrote:
> > > We do not support uClibc-ng/musl C library version choice support,
> > > do the same for GNU C Library.
> > > Add me as Maintainer for the package.
> > > 
> > > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > 
> > On this one, I'd like to have the opinion of others. Arnout? Peter?
> > Yann? What do you think about this?
> > 
> > I don't have a very clear-cut opinion about this one.
> 
> Neither do I.
> 
> On principle, I agree that we should drop versions. But glibc is part of
> the toolchain, and the toolchain has always been special.

It is special, but if we can reduce the whole sum of combinations,
isn't that good? In case of C library, it seems to me that the
lastest version is always the best one. There are fewer regressions
then with changing binutils or gcc default.
 
> True, we do not have a version for uClibc-ng, but we do have some
> traction on the maintainer! ;-) So we know things are gonna be fixed
> soonish, or that we can grab a temporary backport, both very easily.
> 
> Not so much for glibc in my experience...
> 
> musl is another kind of thing, because it is (was?) moving relatively
> fast, and I am under the impression that the maintainers are somewhat
> amenable to some fixes.
> 
> Not so much for glibc in my experience...

I am reading both mailinglists so at least I sometimes fishing
interesting bugfixes, as for the sh4 issue.

If Thomas don't mind I would take musl also over. (DEVELOPERS file)

best regards
 Waldemar
