From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 9 Oct 2006 11:33:06 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061009114134.C2C4E485D4@busybox.net>
References: <20061009114134.C2C4E485D4@busybox.net>
Message-ID: <20061009173306.GA24455@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Oct 09, 2006 at 04:41:34AM -0700, aldot at uclibc.org wrote:
> Author: aldot
> Date: 2006-10-09 04:41:34 -0700 (Mon, 09 Oct 2006)
> New Revision: 16345
> 
> Log:
> - use headers_install for full kernel tarballs used as kernel-headers

An alternative, is there are now some headers being
produced for all architectures by dwmw2:
    ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/kernel-headers/

which looks to be usable for uClibc for all arches with minor tweeks.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
