From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:54:52 +0100
Subject: [Buildroot] [PATCH 1/3] configs/nitrogen*: bump u-boot to
 2018.07
In-Reply-To: <20200326144436.529906-2-gary.bisson@boundarydevices.com>
References: <20200326144436.529906-1-gary.bisson@boundarydevices.com>
 <20200326144436.529906-2-gary.bisson@boundarydevices.com>
Message-ID: <20200326215452.5fa4c6bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 15:44:34 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Changelog summary:
> - Various fixes all over
> - Updated LPDDR4 timings for i.MX8M
> - Support of UUU recovery tool
> - Added support for i.MX8MMini, i.MX8MNano
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 4 ++--
>  configs/nitrogen6x_defconfig  | 4 ++--
>  configs/nitrogen7_defconfig   | 4 ++--
>  configs/nitrogen8m_defconfig  | 8 ++++----
>  4 files changed, 10 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
