From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 11:56:27 +0200
Subject: [Buildroot] [PATCH v3] package/pifmrds: new package
In-Reply-To: <1403366300-29035-1-git-send-email-yann.morin.1998@free.fr>
References: <1403366300-29035-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140629115627.0adb4f49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 21 Jun 2014 17:58:20 +0200, Yann E. MORIN wrote:
> From: Eric Limpens <limpens@gmail.com>
> 
> We needs three little patches:
>   - one to make the existing Makefile cross-compile friendly
>   - one to pass the LDFLAGS at link time
>   - one to add a missing include
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> [yann.morin.1998 at free.fr: add .mk header; cleanup and split the
>  Makefile patch, add missing include; add comments to all patches]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks! I've fixed the BR2_arm dependency, and I've renumbered
the patches to start from 0001 and not 0000.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
