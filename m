From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Tue, 16 Sep 2008 22:14:39 +1200
Subject: [Buildroot] Freetype and Makefile.autotools.in
In-Reply-To: <1221558869.12213.4.camel@lnx32dtp04>
References: <1221558869.12213.4.camel@lnx32dtp04>
Message-ID: <408540dd0809160314h29649721n843bbc04f95b289a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Perhaps we could have an option that allows the auto-patching of libtool
> to be applied?
> something like PKGNAME_LIBTOOL_PATCH (default yes)
>
> What do people think?

yes please.
There are a number of unmaintained packages that dont work with that
patch, it would be better to just provide a custom patch than have to
override the extract target.

~Matthew
