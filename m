From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:09:40 +0200
Subject: [Buildroot] [PATCH 1/1] nut: needs mmu
In-Reply-To: <1396776187-6874-1-git-send-email-romain.naour@openwide.fr>
References: <1396776187-6874-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140406140940.3e73b8cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  6 Apr 2014 11:23:07 +0200, Romain Naour wrote:
> While investigating on build failure [1], I realized that nut needs mmu since fork() is used.
> So, conditions of this build failure are no longer encountered.
> 
> [1] http://autobuild.buildroot.net/results/961/96193e18782697c2af8813a7714b66b4ba1f3d1c//build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/nut/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
