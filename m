From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:27:14 +0200
Subject: [Buildroot] [PATCH] package/libwebsock: fix incorrect inline
 function
In-Reply-To: <1440277469-15130-1-git-send-email-yann.morin.1998@free.fr>
References: <1440277469-15130-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150825122714.38067dbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 22 Aug 2015 23:04:29 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/c02/c0243afc26202cbea98a1a75ddb9e37d8e2e08de/
>     http://autobuild.buildroot.org/results/8a0/8a0f34da29fdfb2807aaa7280759e324a3874851/
>     http://autobuild.buildroot.org/results/3da/3dac7b3504349e06c05fa0170a033e7828a9ab55/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libwebsock/0003-fix-incorrect-inline.patch | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/libwebsock/0003-fix-incorrect-inline.patch

Applied, thanks. Can you submit the patch upstream? I know upstream has
not committed anything since 1 year, but who knows...

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
