From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:21:43 +0200
Subject: [Buildroot] [PATCH] package/kyua: add atf reverse dependency
In-Reply-To: <1437744272-27546-1-git-send-email-romain.naour@openwide.fr>
References: <1437744272-27546-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150726152143.0e781dd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 24 Jul 2015 15:24:32 +0200, Romain Naour wrote:
> atf package depends on BR2_USE_MMU, therefore kyua must
> also depend on it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/929/9290a39d9b77e5a57e59912ce3d901149e9d6c11/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/kyua/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
