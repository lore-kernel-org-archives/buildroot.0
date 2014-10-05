From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 18:16:38 +0200
Subject: [Buildroot] [PATCH 1/8] package/apr: Bump version to 1.5.1
In-Reply-To: <20141005144248.GG4220@free.fr>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <20141005144248.GG4220@free.fr>
Message-ID: <20141005181638.2614c86f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 5 Oct 2014 16:42:48 +0200, Yann E. MORIN wrote:

> > diff --git a/package/apr/apr-0001-cross-compile.patch b/package/apr/apr-0001-cross-compile.patch
> > new file mode 100644
> > index 0000000..6bd1194
> > --- /dev/null
> > +++ b/package/apr/apr-0001-cross-compile.patch
> > @@ -0,0 +1,53 @@
> > +Fix cross-compilation
> > +
> > +Patch submitted upstream:
> > +https://issues.apache.org/bugzilla/show_bug.cgi?id=57058
> 
> which is a bundle of upstream revisions:
>     http://svn.apache.org/viewvc?view=revision&revision=1327907
>     http://svn.apache.org/viewvc?view=revision&revision=1328390
>     http://svn.apache.org/viewvc?view=revision&revision=1328714

I'm confused: if some pieces of code are already upstream and
backported, why do they need to be submitted upstream again?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
