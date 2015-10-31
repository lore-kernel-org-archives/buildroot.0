From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 31 Oct 2015 11:39:59 +0900
Subject: [Buildroot] [PATCH v3 1/1] gauche: new package
In-Reply-To: Your message of Fri, 30 Oct 2015 13:51:16 +0100.
 <563367C4.40607@mind.be>
Message-ID: <201510310240.t9V2e0Go029947@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout.

Ok, I've sent the patch to upstream.

Kawashima

Arnout Vandecappelle writes:
...
> > diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-
> fix-so-suffix.patch
> > new file mode 100644
> > index 0000000..1d8c2a5
> > --- /dev/null
> > +++ b/package/gauche/0001-fix-so-suffix.patch
> > @@ -0,0 +1,18 @@
> > +With uclibc configuration, $host does not match to '*-linux-gnu-*'.
> 
>  uclibc or musl. Oh, and it's gnu*, not gnu-*, otherwise ARM's gnueabi would
> also not match.
> 
> > +I touch configure instead of configure.ac because autoreconf failed
> > +by version mismatch of autotools.
> 
>  Then also include the fix for configure.ac in the same patch, and of course
> please send the patch upstream so we don't have to carry it forever.
============================================================
    Hiroshi Kawashima
