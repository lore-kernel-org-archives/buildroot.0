From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Mar 2019 15:08:45 +0100
Subject: [Buildroot] [PATCH] package/buysbox: fix build with individual
 binaries
In-Reply-To: <20190330084641.9269-1-yann.morin.1998@free.fr>
References: <20190330084641.9269-1-yann.morin.1998@free.fr>
Message-ID: <20190330150845.4f98153f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 09:46:41 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Fixes:
>     http://autobuild.buildroot.org/results/053/0539b3765eaa99029c4185ae89db6adb9e867078/
> 
> Kudos to Thomas for pinpointing the actual issue.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> Peter, this is a candidate for 2019.02.x.
> ---
>  ...-mark-scripted_main-as-externally-visible.patch | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
