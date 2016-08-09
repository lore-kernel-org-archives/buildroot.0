From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:49:01 +0200
Subject: [Buildroot] [PATCH] package/weston: no-break space U+A0
 (U8+C2A0)
In-Reply-To: <1470770646-21912-1-git-send-email-yann.morin.1998@free.fr>
References: <1470770646-21912-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160809224901.18f31321@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 21:24:06 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/f49/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/
>     http://autobuild.buildroot.org/results/1d3/1d3e7f07388ae11d70103e04d8a14c20d50fc212/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  ...ompositor-rdp-fix-no-break-space-U-A0-U8-.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
