From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Wed, 31 Oct 2007 07:50:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
In-Reply-To: <20071031064036.F3C42A65D5@busybox.net>
References: <20071031064036.F3C42A65D5@busybox.net>
Message-ID: <1193813403.1661.4.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-10-30 at 23:40 -0700, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2007-10-30 23:40:36 -0700 (Tue, 30 Oct 2007)
> New Revision: 20347
> 
> Log:
> update ltmain.sh in libmad by running libtoolize during build
> 

Then libtools must be checked in dependencies.sh as well.

> Modified:
>    trunk/buildroot/package/libmad/libmad.mk
> 

<cut patch>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
