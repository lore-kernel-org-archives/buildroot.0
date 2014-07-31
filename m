From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:20:31 +0200
Subject: [Buildroot] [PATCH 1/1] udev: remove left-over S10udev script
 from udev virtual package
In-Reply-To: <1406773944-2022-1-git-send-email-danomimanchego123@gmail.com>
References: <1406773944-2022-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140731202031.76ab7108@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 30 Jul 2014 22:32:24 -0400, Danomi Manchego wrote:
> The S10udev script is not installed or referenced, and eudev has its own
> S10udev.  So we can simply remove it.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/udev/S10udev |   48 ------------------------------------------------
>  1 file changed, 48 deletions(-)
>  delete mode 100755 package/udev/S10udev

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
