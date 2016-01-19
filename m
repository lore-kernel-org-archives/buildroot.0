From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:24:40 +0100
Subject: [Buildroot] [PATCH] gst-ffmpeg: disable for MIPS R6
In-Reply-To: <1453204981-7883-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453204981-7883-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160119212440.6350b1d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 19 Jan 2016 12:03:01 +0000, Vicente Olivert Riera wrote:
> This package bundles a version of libav which doesn't have support for
> MIPS R6.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/e54/e54f0f9aa8fbc1760379ce64d17422810864b56b/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gstreamer/gst-ffmpeg/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
