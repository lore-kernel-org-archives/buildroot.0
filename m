From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 25 Jan 2011 22:28:23 +0100
Subject: [Buildroot] [git commit master 1/1] crosstool-ng: don't remove
	installation directory before installing
In-Reply-To: <20110125211621.EA9998D245@busybox.osuosl.org>
References: <20110125211621.EA9998D245@busybox.osuosl.org>
Message-ID: <201101252228.23801.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tuesday 25 January 2011 22:07:14 Peter Korsgaard wrote:
> crosstool-ng would normally delete its installation directory before
> installing the toolchain to ensure it wouldn't get confused by an earlier
> build. Now that we're installing directly into HOST_DIR/usr, this doesn't
> work very well - So get rid of the rm's.

Too late, but:
Acked-by: me

But anyway, I would like to carry as few patches against crosstool-NG as
possible in buildroot, and push as much as possible into upstream.

If you would rework that to be configurable, I would apply it, so it gets
in the next release.

As I plan to update the crosstool-NG backend during the next BDD in
Brussels, it means we could then get rid of that patch in buildroot.

And if you have patches against crosstool-NG, and they are not BR-related,
could you Cc: me (and the crossgcc ML) so I can apply them upstream? Thx.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
