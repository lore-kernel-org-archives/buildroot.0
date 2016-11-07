From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:07:00 +0100
Subject: [Buildroot] [PATCH] libmpeg2: add patch to fix build on ARMv7-M
In-Reply-To: <1478369930-10514-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478369930-10514-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161107230700.1e0696a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 19:18:50 +0100, Thomas Petazzoni wrote:
> This commit adds a patch to libmpeg2 that improves the ARM detection
> to not use the optimized ARM code on ARMv7-M architectures.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9c44de035ce81c6cc8a92ea8bad4def25cd99cd0
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libmpeg2/0003-fix-arm-detection.patch | 39 +++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libmpeg2/0003-fix-arm-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
