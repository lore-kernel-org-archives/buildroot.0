From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:23:26 +0200
Subject: [Buildroot] [PATCH v1] package/haveged: bump version to 1.9.14
In-Reply-To: <20210321205908.10167-1-ps.report@gmx.net>
References: <20210321205908.10167-1-ps.report@gmx.net>
Message-ID: <20210330222326.5ef6482e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for this patch!

On Sun, 21 Mar 2021 21:59:08 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - change to set all available configure options:
> 
>   * '--enable-daemon=yes': previous default
> 
>   * '--enable-diagnostic=no': previous default
> 
>   * '-enable-init=no': do not install init files as buildroot ships its
>     own sysv/systemd init files
> 
>   * '--enable-nistest=no': disable tests, previous default
> 
>   * '--enable-enttest=no': new option, disable tests
> 
>   * '--enable-olt=no': previous default was yes, disable builtin test
> 
>   * '--enable-tune=yes': previous default

Do you have any reason for using --enable-<foo>=yes/no instead of the
standard --enable-<foo> / --disable-<foo> we use everywhere in
Buildroot ?

> +# patch touchign configure.ac

                ^^ minor typo

(I would have fixed myself, but I have the other question
enable/disable options).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
