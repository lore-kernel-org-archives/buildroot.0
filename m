From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:45:38 +0200
Subject: [Buildroot] [PATCH 3/4] package/lttng-tools: bump version to
 2.12.1
In-Reply-To: <20200626220603.29561-3-nolange79@gmail.com>
References: <20200626220603.29561-1-nolange79@gmail.com>
 <20200626220603.29561-3-nolange79@gmail.com>
Message-ID: <20200627164538.741aadca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 00:06:01 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Also update hash file formatting (2 spaces).
> 
> License files got moved into a subfolder,
> use those new paths.
> 
> Also the package is (L)GPL only, so remove the
> "or higher".
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/lttng-tools/lttng-tools.hash | 14 +++++++++-----
>  package/lttng-tools/lttng-tools.mk   |  6 +++---
>  2 files changed, 12 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
