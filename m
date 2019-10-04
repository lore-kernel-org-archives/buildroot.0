From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Oct 2019 10:49:29 +0200
Subject: [Buildroot] [PATCH 4/9] package/libyang: add package
In-Reply-To: <20191002092515.346cc314@windsurf.home>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-4-heiko.thiery@gmail.com>
 <20191002092515.346cc314@windsurf.home>
Message-ID: <CAEyMn7YQhGRQ1cDwcJUBXoXALo11CPxaadSzcT=DorueSStKBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Should be just:
>
>         bool "libyang"
>
> > +     depends on !BR2_STATIC_LIBS
> > +     select BR2_PACKAGE_PCRE
>
> The home page at https://github.com/CESNET/libyang says:
>
>    note, that PCRE is supposed to be compiled with unicode support
>    (configure's options --enable-utf and --enable-unicode-properties)
>
> So I think you need:
>
>         select BR2_PACKAGE_PCRE_UTF
>
> Could you make sure it is indeed needed?

Your are right .. I added this.

--
Heiko
