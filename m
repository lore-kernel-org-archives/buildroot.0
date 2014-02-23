From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 20:16:40 +0100
Subject: [Buildroot] [PATCH] lua: needs dynamic library support (dlopen)
In-Reply-To: <CAB0FRssLEc6ntNwO53oDL-+yNSnBkBnP=wr7VAS3ox2WZ+HsCA@mail.gmail.com>
References: <8a14c6297835e91f6691.1393175989@argentina>
 <20140223183830.2a7c25eb@skate>
 <d16bf125-1e0d-4c3a-a591-7cd43b3c7469@email.android.com>
 <CAB0FRssLEc6ntNwO53oDL-+yNSnBkBnP=wr7VAS3ox2WZ+HsCA@mail.gmail.com>
Message-ID: <20140223201640.145e11f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sun, 23 Feb 2014 19:15:41 +0100, Fran?ois Perrad wrote:

> >>No, that's not the correct fix. The correct fix is a variant of
> >>http://patchwork.ozlabs.org/patch/313208/, which as suggested by Peter
> >>should use BR2_PREFER_STATIC_LIB as a condition, and not
> >>BR2_BINFMT_FLAT.
> >
> > Ok, understood.
> > Francois, what are your plans with that patch?
> 
> http://patchwork.ozlabs.org/patch/313208/ is a V1 with BR2_BINFMT_FLAT.
> I've already send a V2, see
> http://patchwork.ozlabs.org/patch/314145/ --> lua: refactor install steps
> http://patchwork.ozlabs.org/patch/314146/ --> lua: handles BR2_PREFER_STATIC_LIB
> 
> Note: V1 fixes only compilation issue, V2 handles compilation,
> linking, and installation

Generally speaking, I would recommend you (and I believe I already did)
to write more detailed commit logs. It would clearly help to get your
patches merged. Your first patch has absolutely no information, and
your second patch only references the autobuilder failure.

As a rule of thumb, if your patch is not trivial, there should at least
be 2 or 3 paragraphs of text in the commit log. If there is not 2 or 3
paragraphs, then you should, before sending the patch, wonder if there
is really enough information for an external reviewer to understand
what's going on.

I really, really appreciate all your contributions, and I would like to
see them merged faster. And to help achieve this, better commit logs is
definitely a key thing.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
