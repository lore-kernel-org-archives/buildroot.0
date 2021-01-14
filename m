From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:33:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/usbutils: needs gcc >= 4.9
In-Reply-To: <20210114065608.119951-1-fontaine.fabrice@gmail.com>
References: <20210114065608.119951-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114223328.0193a130@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 07:56:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate the
> gcc dependency from libusb to usbutils
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ed8706a1ead398b5097b046524e710b1d3d0bb1e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usbutils/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
