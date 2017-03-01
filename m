From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:14:17 +0100
Subject: [Buildroot] [PATCH] Revert "dependencies/cmake: blacklist cmake
 3.7"
In-Reply-To: <1488401984-30053-1-git-send-email-yann.morin.1998@free.fr>
References: <1488401984-30053-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170301221417.25a61f9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 21:59:44 +0100, Yann E. MORIN wrote:
> This reverts commit 4422eca2d418e2b817b419ff6c4c62f7f4cb7871.
> 
> We now have a workaround for the RPATH issue introduced in 3.7, so we
> can use it again.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/dependencies/check-host-cmake.sh | 8 --------
>  1 file changed, 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
