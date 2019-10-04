From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Oct 2019 10:52:19 +0200
Subject: [Buildroot] [PATCH 6/9] package/sysrepo: add package
In-Reply-To: <20191002113419.59b3b3db@windsurf>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-6-heiko.thiery@gmail.com>
 <20191002113419.59b3b3db@windsurf>
Message-ID: <CAEyMn7Y80E2gOiVJS=LLZYQOAggKThWMYSsa9rCotc1AUpBxaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on !BR2_STATIC_LIBS
> > +     depends on !BR2_TOOLCHAIN_USES_MUSL
>
> Could you add a comment that explains why it doesn't build on musl ?

This is invalid and I removed the dependency.
