From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 21:18:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/multipath-tools: new package
In-Reply-To: <20200903234234.2f4d6793@windsurf.home>
References: <20200831185010.16556-1-egorenar-dev@posteo.net>
 <20200903234234.2f4d6793@windsurf.home>
Message-ID: <87pn70uj5t.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> I've disabled that by passing STACKPROT= as a make option, which allows
> to get passed that. But then it fails with:
>
> parser.c: In function ?set_value?:
> parser.c:375:4: error: ?strncat? specified bound 1 equals source length [-Werror=stringop-overflow=]
>     strncat(alloc, " ", 1);
>     ^~~~~~~~~~~~~~~~~~~~~~
>
> Could you test this package a bit better by using ./utils/test-pkg ?

Done.

>
> Patches should be generated with "git format-patch -N", so that we have
> [PATCH] instead of [PATCH 1/1].
>

Fixed.

>
> Ditto.
>

Fixed.

>
> We need you to add your Signed-off-by on all patches you've imported.
>

Fixed.

>
> 	w/ threads, dynamic library
>

Fixed.

> Some lines are too long. Please run "make check-package" and ensure you
> don't have any warning.
>

Fixed.


Thank you for feedback and patience
Regards
Alex
