From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 May 2015 22:25:47 +0000
Subject: [Buildroot] [PATCH] package/binutils (arc): backport PR56780
	patches
In-Reply-To: <1431552996-18992-1-git-send-email-romain.naour@openwide.fr>
References: <1431552996-18992-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431555947.3047.27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2015-05-13 at 23:36 +0200, Romain Naour wrote:
> --disable-install-libiberty configure option is broken
> in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.
> 
> This library broke the host-gdb build due to a fpic/fPIC issue.
> 
> Since binutils use a copy of gcc's libiberty sources, it's
> affected by the same bug.
> 
> binutils-arc-2014.11 which is based on 2.23 branch doesn't have
> the PR56780 fixies, so backport them.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ca4/ca45297aa0ffbc9062ed92dc7ac070b0b33001de/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
