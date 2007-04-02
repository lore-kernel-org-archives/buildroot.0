From: Zachary P. Landau <kapheine@gmail.com>
Date: Mon, 2 Apr 2007 09:50:46 -0400
Subject: [Buildroot] GCC version detection in toolchain/gcc/Makefile.in
In-Reply-To: <20070330232557.GA18174@reid1.localdomain>
References: <20070330232557.GA18174@reid1.localdomain>
Message-ID: <a04f56da0704020650pae7102euc325991dd57bd21a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > That sounds plausible, yes.
> > What do you suggest to distinguish between gcc version 4.4.9 and
> > 3.4.6?
>
> Does make accept the '^' character for start of string/line?
>
> With grep you can do this:
>
>  $ echo 3.4.1 | grep "4.1"
>  3.4.1
>  $
>  $ echo 3.4.1 | grep "^4.1"

I tried that initially, but it doesn't seem to work.  And looking at
the documentation for findstring, it doesn't mention any sort of
regular expression support.

-- 
Zachary P. Landau <kapheine@gmail.com>
