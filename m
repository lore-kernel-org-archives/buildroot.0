From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 15:41:30 +0200
Subject: [Buildroot] [PATCH] package/ti-gfx: needs ia32 libraries
In-Reply-To: <1459117907-9225-1-git-send-email-yann.morin.1998@free.fr>
References: <1459117907-9225-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160328154130.56a41c14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 00:31:47 +0200, Yann E. MORIN wrote:
> The installer is a 32-bit executable, so we need the 32-bit libraries on
> the host to be able to execute it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/ti-gfx/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
