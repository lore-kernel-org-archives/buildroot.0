From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 15:24:38 +0100
Subject: [Buildroot] [PATCH v3] libtorrent: disable on ARC arch
In-Reply-To: <1392041381-32699-1-git-send-email-anton.kolesov@synopsys.com>
References: <20140210135318.4fc79cae@skate>
 <1392041381-32699-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <20140210152438.06e8594f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 10 Feb 2014 18:09:41 +0400, Anton Kolesov wrote:
> Libtorrent has dependencies on atomic operations. However ARC GCC doesn't
> implement those at the moment so package should be disabled. Rtorrent
> depends on libtorrent.
> 
> This fixes:
> http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/
> 
> Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
> ---
>  package/libtorrent/Config.in | 3 +++
>  package/rtorrent/Config.in   | 3 +++
>  2 files changed, 6 insertions(+)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
