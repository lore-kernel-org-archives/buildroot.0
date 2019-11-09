From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 14:51:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/ffmpeg: Enable ARC glibc builds
In-Reply-To: <20191108174112.28183-4-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-4-vgupta@synopsys.com>
Message-ID: <20191109145104.22780f54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Nov 2019 09:41:12 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> ARC glibc fenv.h has the needed macros for quite some time now so allow
> ffmpeg builds
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  package/ffmpeg/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
