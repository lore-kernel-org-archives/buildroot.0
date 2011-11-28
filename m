From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 13:33:59 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <201111281324.38619.minimod@morethan.org>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
Message-ID: <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Try:
> "file:///"

Sorry, I meant to imply I had the 3 slashes, with the 3rd one being for the
path.  So I've been using "file:///" all along, I just wrote "file://" since
that is the "scheme" part.

> Check me on this - see if I am following your description -
> The site:
> http://etherlab.org/en/components.php
>
> Has a multiple component download file:
> http://etherlab.org/download/bundle/etherlab-bundle-1.4.tar.bz2

That's the correct site, but not the version.  The latest tries to take you
to sourceforge for a download.  And navigating there didn't work too well.

If the "file" versus "http" was the problem, I could try working on that.
But it seems like something else is the issue for now.  Somehow this thinks
it already put the file in dl/ and it hasn't.
