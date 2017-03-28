From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:49:24 +0200
Subject: [Buildroot] [PATCH] powerpc-utils: Bump to v1.3.3
In-Reply-To: <20170328053702.27113-1-sam@mendozajonas.com>
References: <20170328053702.27113-1-sam@mendozajonas.com>
Message-ID: <20170328214924.15164d0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 16:37:02 +1100, Samuel Mendoza-Jonas wrote:
> In particular this includes commit d63e12a "nvram:read list of partion
> names dynamically" which fixes an issue preventing the nvram tool from
> writing to certain partitions.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  package/powerpc-utils/powerpc-utils.hash | 2 +-
>  package/powerpc-utils/powerpc-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
