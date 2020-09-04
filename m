From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:05:41 +0200
Subject: [Buildroot] [PATCH v2] package/mg: new package
In-Reply-To: <20200901053858.156993-1-troglobit@gmail.com>
References: <20200901053858.156993-1-troglobit@gmail.com>
Message-ID: <20200904110541.71a494b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Sep 2020 07:38:59 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Mg is a small Emacs-like editor with no external dependencies except a
> standard C library.  It weighs in at 130 kiB and is one of a select few
> completely free (public domain) text editors suitable for small and
> embedded systems.
> 
> This version is based on the OpenBSD Mg, but with more features, one of
> which being the no-ncurses/termcap support, which heavily reduces the
> impact on a resource constrained system.
> 
> Upstream: https://github.com/troglobit/mg/
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - mg2a -> mg in mg.mk comment (suggested by Thomas Pettazoni)
>   - Fix copy-paste in mg.hash comment (suggested by Gilles Talis)
>   - Add mg to my DEVELOPERS entry (suggested by Gilles)
>   - Update my last name in DEVELOPERS
>   - Drop install+gzip of tutorial (Gilles and Thomas)
>   - Simplify mg.mk, standard install target is sufficient
>   - Add `--with-curses` to MG_CONF_OPTS (Gilles and Thomas)
>   - Run test-pkg, 5/6 OK (cortex m4 SKIPPED) (Gilles)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
