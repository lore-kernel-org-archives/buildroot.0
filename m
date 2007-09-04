From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 5 Sep 2007 00:19:16 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
In-Reply-To: <fbkjea$tfd$1@sea.gmane.org>
References: <fbkjea$tfd$1@sea.gmane.org>
Message-ID: <20070904221916.GB11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 04, 2007 at 11:40:15PM +0200, Micha Nelissen wrote:
>Hi,
>
>I am using buildroot SVN, gcc 4.2.1, uclibc 0.9.29, armeb-linux for
>xscale. I've configured to use software floating point. Linking of
>uclibc fails, it cannot find some functions which seem software floating
>point related e.g. __floatsidf. Objdump'ing the libgcc.a file, this
>function is present, but section *UND* is listed instead of .text.

>Any idea how to solve this?

Retry with a shared libgcc
