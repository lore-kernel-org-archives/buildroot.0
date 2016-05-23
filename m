From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:56:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/hplip: fix static linking with
 cups
In-Reply-To: <1463976152-12874-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463976152-12874-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160523125620.225e85b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 06:02:32 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/c52/c5277c42344d194e004dcd0a5af71bc6110da97e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/hplip/hplip.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
