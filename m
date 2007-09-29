From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 20:24:07 +0200
Subject: [Buildroot] Recent touch of gcc-uclibc-3.mk [was: Re: svn
	commit:	trunk/buildroot/toolchain/gcc]
In-Reply-To: <20070929173259.431383003F@busybox.net>
References: <20070929173259.431383003F@busybox.net>
Message-ID: <20070929182407.GR20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 10:32:59AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-29 10:32:58 -0700 (Sat, 29 Sep 2007)
>New Revision: 20117
>
>Log:
>Use linke to build-time-tools, disable libssp which does not work for cross-compile

What do you mean by "Use linke"?

Also, generally disabling libssp doesn't sound like a bright idea; I
don't remember any trouble when cross-compiling from i686->i386-uclibc
so i'm not too excited by you hardcoding that.

Oh, and you checked *thoroughly* not to break gcc-3.4.6, did you?
