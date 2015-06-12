From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:28:03 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix dependencies
In-Reply-To: <1434106383-60787-1-git-send-email-benoit@wsystem.com>
References: <1434106383-60787-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150612212803.26674877@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 12 Jun 2015 12:53:03 +0200, Beno?t Th?baudeau wrote:
> The ffmpeg binary does not require swscale, but ffplay needs it.
> 
> ffserver needs fork().
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  package/ffmpeg/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
