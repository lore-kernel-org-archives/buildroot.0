From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:34:34 +0200
Subject: [Buildroot] [PATCH] ffmpeg: bump version to 3.3
In-Reply-To: <20170413134441.55184-1-Vincent.Riera@imgtec.com>
References: <20170413134441.55184-1-Vincent.Riera@imgtec.com>
Message-ID: <20170413213434.6e723347@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 14:44:41 +0100, Vicente Olivert Riera wrote:
> And remove non-existent configure options from ffmpeg.mk:
> 
>   --disable-x11grab
>   --disable-memalign-hack
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
