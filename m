From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 9 Oct 2006 14:34:37 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061009173306.GA24455@codepoet.org>
References: <20061009114134.C2C4E485D4@busybox.net>
	<20061009173306.GA24455@codepoet.org>
Message-ID: <20061009203437.GA26440@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Oct 09, 2006 at 11:33:06AM -0600, Erik wrote:
> An alternative, is there are now some headers being
> produced for all architectures by dwmw2:
>     ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/kernel-headers/
> 
> which looks to be usable for uClibc for all arches with minor tweeks.

Even better, it appears this is simply the result of
running 'make headers_install_all' which is now present
in 2.6.19-rc1.  So once 2.6.19 final is out, it will make
generating kernel headers _MUCH_ easier for us,

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
