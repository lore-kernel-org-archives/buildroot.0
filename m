From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:19:09 +0200
Subject: [Buildroot] [PATCH vX 1/1] package/libyang: fix build w/o
 threads
In-Reply-To: <20191024063716.6562-1-heiko.thiery@gmail.com>
References: <20191024063716.6562-1-heiko.thiery@gmail.com>
Message-ID: <20191025201909.7f5e0f3b@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 08:37:16 +0200
heiko.thiery at gmail.com wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> For building libyang a toolchain with thread support is needed. Add the dependancy
> to BR2_TOOLCHAIN_HAS_THREADS.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/1d84ff4aab67a98113d967b65467109e80bb5917
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  package/libyang/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
