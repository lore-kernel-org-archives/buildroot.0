From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:02:58 +0200
Subject: [Buildroot] [PATCH] legacy: i386 is legacy, inform the user
In-Reply-To: <1462722109-17239-1-git-send-email-yann.morin.1998@free.fr>
References: <1462722109-17239-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160509220258.034ba1d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 May 2016 17:41:49 +0200, Yann E. MORIN wrote:
> When we dropped support for i386, we added the corresponding opiton to
> the legacy menu, but forgot to select BR2_LEGACY.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  Config.in.legacy | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
