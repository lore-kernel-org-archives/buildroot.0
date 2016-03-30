From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:39:52 +0200
Subject: [Buildroot] [PATCH] gst1-libav: pass --cpu config option to
 bundled ffmpeg
In-Reply-To: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160330193952.2e872f06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 14:15:52 -0300, Gustavo Zacarias wrote:
> Like the proper ffmpeg package does, fixes:
> http://autobuild.buildroot.net/results/a46/a462dae8df2450bc0f72cbed6125e106454bde0f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-libav/gst1-libav.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

<rant>Can I say, once again, how much I hate bundled libraries?</rant>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
