From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 16:02:32 +0100
Subject: [Buildroot] [PATCH 3/7 v4] support/test-pkg: simplify the
	config check
In-Reply-To: <b36d56df4dd3ca5c4a1e91fd5baa3226a83d1cf3.1486911180.git.yann.morin.1998@free.fr>
References: <cover.1486911180.git.yann.morin.1998@free.fr>
 <b36d56df4dd3ca5c4a1e91fd5baa3226a83d1cf3.1486911180.git.yann.morin.1998@free.fr>
Message-ID: <20170212160232.6e6e4d01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 15:53:07 +0100, Yann E. MORIN wrote:
> Use comm(1) to check that all our config options are properly set in the
> resulting configuration, rather than our canned and fragile code.
> 
> Reported-by: Cam Hutchison <camh@xdna.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/scripts/test-pkg | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
