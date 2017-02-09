From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:32:49 +0100
Subject: [Buildroot] [PATCH 2/6] arch: mark NIOS II as affected by GCC
 PR libstdc++/64735
In-Reply-To: <20170209174759.15819-3-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-3-joerg.krause@embedded.rocks>
Message-ID: <20170209213249.6b269fe7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 18:47:55 +0100, J?rg Krause wrote:
> NIOS II does not support always lock-free atomic ints. Therefore,
> exception_ptr, nested_exception, and future from libstdc++ are not
> available before GCC 7.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  arch/Config.in | 1 +
>  1 file changed, 1 insertion(+)

I've marked patches 2, 3 and 4 as rejected in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
