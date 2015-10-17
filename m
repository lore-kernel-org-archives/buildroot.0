From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:33:11 +0200
Subject: [Buildroot] [PATCH] ffmpeg: let the user override the --cpu
 value
In-Reply-To: <1444911775-45783-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444911775-45783-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151017163311.0de80d9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 15 Oct 2015 13:22:55 +0100, Vicente Olivert Riera wrote:
> Grab the content of BR2_PACKAGE_FFMPEG_EXTRACONF after guessing the CPU,
> so the user will still have the possibility to override it.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ffmpeg/ffmpeg.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
