From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:03:49 +0200
Subject: [Buildroot] [PATCH] dhcpcd: fix build with ccache
In-Reply-To: <d3257052bc958700588f.1403443612@localhost>
References: <d3257052bc958700588f.1403443612@localhost>
Message-ID: <20140622190349.132ab9f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 22 Jun 2014 15:26:52 +0200, Thomas De Schampheleire wrote:
> After the bump to dhcpcd 6.4.0, building dhcpcd with ccache fails at the
> configure step:
> 
> Using compiler .. <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc
> <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc is not an executable
> make: *** [<buildroot>/output/build/dhcpcd-6.4.0/.stamp_configured] Error 1
> 
> This patch backports an upstream patch to fix this issue.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
