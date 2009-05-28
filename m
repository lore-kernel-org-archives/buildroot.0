From: Marc Gauthier <marc@tensilica.com>
Date: Thu, 28 May 2009 07:57:43 -0700
Subject: [Buildroot] [PATCH] fix dropbear install
In-Reply-To: <87my8x76hl.fsf@macbook.be.48ers.dk>
References: <522C1DF17AF50042AD8AE87F7887BD3D0158B35BFF@exch.hq.tensilica.com>
	<87my8x76hl.fsf@macbook.be.48ers.dk>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D0158B35C2E@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> >>>>> "Marc" == Marc Gauthier <marc@tensilica.com> writes:
>
>  Marc> Fix dropbear install
>
>  Marc> The -D option to install only works portably when the
>  Marc> destination is a file.  Specifying the filename avoids the
>  Marc> following build error (at least on some hosts):
>  Marc> "/usr/bin/install: cannot overwrite directory `/tmp/buildroot/
>  Marc> project_build_foobar/uclibc/root/etc/init.d' with
>  Marc> non-directory"
>
> On what OS / install version? Anyway, it cannot hurt, so committed.

Fedora Core 3.  Has install (coreutils) 5.2.1.

> Your patch is writespace mangles / line wrapped, please use git
> send-email instead next time.

I'll try that.  (Was hoping sending as HTML avoided that, oh well.)

Thanks!
-Marc
