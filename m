From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:46:32 +0200
Subject: [Buildroot] [PATCH 2/3] weston: remove dependency on mesa3d to
 enable egl
In-Reply-To: <20180516155201.10279-3-gary.bisson@boundarydevices.com>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
 <20180516155201.10279-3-gary.bisson@boundarydevices.com>
Message-ID: <20180519224632.76c10553@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 May 2018 17:52:00 +0200, Gary Bisson wrote:
> Other packages can actually provide Wayland libraries like imx-gpu-viv.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/weston/weston.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
