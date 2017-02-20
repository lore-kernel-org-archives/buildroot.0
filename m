From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:25:22 +0100
Subject: [Buildroot] [PATCH 1/4] Revert "bctoolbox: fix typos and logic
 error"
In-Reply-To: <20170214224402.8785-1-joerg.krause@embedded.rocks>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
Message-ID: <20170220222522.7a759369@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 23:43:59 +0100, J?rg Krause wrote:
> This reverts commit 5c4d3560b94c9cb8f1594c9200a632b89ddf7aa0.
> 
> Although the patch fixes the build error it does not set the flags for
> Libs.private properly. A fellow-up patch will provide a better solution
> for this issue.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/bctoolbox/0001-fix-typo.patch | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 package/bctoolbox/0001-fix-typo.patch

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
