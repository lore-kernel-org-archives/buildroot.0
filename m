From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:12:15 +0200
Subject: [Buildroot] [PATCH 1/1] kmod: remove unnecessary autoreconf
In-Reply-To: <1437162283-20292-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437162283-20292-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150718111215.5188dbe5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 17 Jul 2015 21:44:43 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Commit 047fea1d4fa33c4c934272a05649907a59186015 removed a patch on kmod that
> was the reason for autoreconfiguring kmod, but autoreconf itself was not
> removed.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/kmod/kmod.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
