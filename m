From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:43:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/gstreamer1/gst1-libav: not
 available on nios2
In-Reply-To: <1463902120-8275-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463902120-8275-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160522214343.11061890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 09:28:39 +0200, Bernd Kuhls wrote:
> ffmpeg is not available on nios2, this limitation was not reverse-
> propagated to this package.
> 
> Fixes
> http://autobuild.buildroot.net/results/267/2674395c1d804df68e7e4bc9bba1d6b7fc6d2dce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gstreamer1/gst1-libav/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
