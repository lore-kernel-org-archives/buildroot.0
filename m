From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Jun 2007 20:09:13 +0200
Subject: [Buildroot] PATCH: Clear package config build warnings on newer
	GCC's
In-Reply-To: <059401c7b819$e2c1e6c0$6e02a8c0@k2>
References: <059401c7b819$e2c1e6c0$6e02a8c0@k2>
Message-ID: <20070626180913.GE4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 26, 2007 at 12:46:11PM -0500, Rick Foos wrote:
>Watching all the warnings on package/config finally got to me.
>
>A patch that clears the gcc warnings from config with cast changes only.
>
>thanks, I feel better now,

:)

A few days ago, i said:
i wouldn't mind if we would pull the lxdialog from the current kernel, fwiw. patches welcome
Lta, if you do this, please also provide a diff with the buildroot specific changes, so we can easily pull upstream changes
