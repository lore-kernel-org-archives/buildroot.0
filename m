From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:05:28 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add amdgpu firmware
 blobs.
In-Reply-To: <20180427115143.20338-1-davidb@230ruedubac.fr>
References: <20180427115143.20338-1-davidb@230ruedubac.fr>
Message-ID: <20180428220528.54e5eb6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Fri, 27 Apr 2018 13:51:43 +0200, David Barbion wrote:
> Add support for Volcanic Islands (VI), Sea Islands (CI) and Southern
> Islands (SI) cards.
> 
> This firmware files will be needed if linux kernel is compiled with
> amdgpu enabled.
> 
> Signed-off-by: David Barbion <davidb@230ruedubac.fr>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)

I've updated linux-firmware.hash with the hash for LICENSE.amdgpu and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
