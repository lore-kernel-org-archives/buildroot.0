From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:48:48 +0200
Subject: [Buildroot] [PATCH] package/qt5: allow to use imx-gpu-viv as
 GBM provider
In-Reply-To: <20200929082017.19485-1-gary.bisson@boundarydevices.com>
References: <20200929082017.19485-1-gary.bisson@boundarydevices.com>
Message-ID: <20200930214848.388dd804@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Sep 2020 10:20:17 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Needed in order to use eglfs_kms platform backend.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
