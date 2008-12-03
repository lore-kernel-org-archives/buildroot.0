From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 3 Dec 2008 20:01:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  liboil
In-Reply-To: <20081203090246.B5CC23C869@busybox.net>
References: <20081203090246.B5CC23C869@busybox.net>
Message-ID: <200812032001.19356.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tpetazzoni at uclibc.org, 03.12.2008:
> Modifications by Thomas Petazzoni:
> 
>  - Remove the glib2 dependency, which is only necessary to build a few
>    examples. If glib2 is enabled in the configuration, then we still
>    depend on it in order to build the examples, but that's just
>    pedantic, not so useful.

I don't remember why I added the glib2 dependency, maybe just taken from
Gentoo's ebuild? I prefer disabling it for a faster build, though.

Markus
