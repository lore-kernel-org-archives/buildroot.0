From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:29:19 +0200
Subject: [Buildroot] [PATCH] trinity: fix glibc/kernel headers conflict
In-Reply-To: <0c3077fb3a4c82ea2570106a3357e9cae19cdd3d.1492060046.git.baruch@tkos.co.il>
References: <0c3077fb3a4c82ea2570106a3357e9cae19cdd3d.1492060046.git.baruch@tkos.co.il>
Message-ID: <20170413212919.3382430b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 08:07:26 +0300, Baruch Siach wrote:
> Add upstream patch that fixes conflicting definitions of ax25 related structs.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b40/b40d045f41dc4dbc66d5092ea5e9e045cd825e31/
> http://autobuild.buildroot.net/results/367/367199b6071c450159aa2ea74d6d1b4b7cb89a88/
> http://autobuild.buildroot.net/results/35e/35e97e51a6f7184d7b708c62a726ab91a0f546b2/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/trinity/trinity.hash | 1 +
>  package/trinity/trinity.mk   | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
