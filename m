From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 09:38:56 +0100
Subject: [Buildroot] [PATCH] package/ccache: bump to version 3.3.3
In-Reply-To: <20161107230232.26087-1-joerg.krause@embedded.rocks>
References: <20161107230232.26087-1-joerg.krause@embedded.rocks>
Message-ID: <20161108093856.7766b067@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 00:02:32 +0100, J?rg Krause wrote:
> Note, that version 3.3.3 of ccache fixes a bug [1] where the Linux
> kernel image is the same even after changing the source code and
> rebuilding it.
> 
> [1] https://github.com/ccache/ccache/issues/136
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/ccache/ccache.hash | 4 ++--
>  package/ccache/ccache.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
