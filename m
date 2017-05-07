From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:47:33 +0200
Subject: [Buildroot] [PATCH] package/ltp-testsuite: needs threads NPTL
In-Reply-To: <20170507122324.31452-1-romain.naour@gmail.com>
References: <20170507122324.31452-1-romain.naour@gmail.com>
Message-ID: <20170507154733.6b0e717e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 14:23:24 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/3e0/3e0bbf41e339e62422463773bf07945f048a9501
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/ltp-testsuite/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
