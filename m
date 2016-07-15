From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:03:25 +0200
Subject: [Buildroot] [PATCH 1/3] package/rt-tests: switch to the
 upstream repository
In-Reply-To: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
References: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160715150325.5cff9584@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 21:01:07 +0200, Romain Naour wrote:
> rt-tests is not maintained from Clark Williams's repository anymore.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> We missed some rt-tests release (v0.90 to v1.0).
> Since v0.92 a release tarball is available at
> https://www.kernel.org/pub/linux/utils/rt-tests so we
> no longer need to clone the git repository.
> ---
>  package/rt-tests/rt-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
