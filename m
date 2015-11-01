From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 2 Nov 2015 00:36:07 +0100
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths
 (branch yem/xorg)
In-Reply-To: <cover.1446416019.git.yann.morin.1998@free.fr>
References: <cover.1446416019.git.yann.morin.1998@free.fr>
Message-ID: <20151102003607.1fa9f695@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon,  2 Nov 2015 00:00:09 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Hello All!
> 
> This series is an attempt to fix the installation paths of many
> Xorg-related packages.
> 
> *This is an RFC.*  There is an alternate proposal after the explanations
> on the series.
> 
> The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
> path variables returned by pkgconf are now prefixed with the sysroot
> directory.
> 

...this commit breaks some other packages too, see [1] for libv4l example.

This commit removed a patch named '0002-fix-double-sysroot.patch', I think
this patch should somehow be forward ported to the new pkconf packet...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/141429.html
