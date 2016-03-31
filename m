From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:45:57 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-libav: switch to unbundled
In-Reply-To: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160331034557.07c02d1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 16:36:39 -0300, Gustavo Zacarias wrote:
> It avoids the crazy in handling all of the ffmpeg options here as well,
> and potentially avoids target code duplication, hence resulting in a
> size reduction.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-libav/Config.in     |  2 +
>  package/gstreamer1/gst1-libav/gst1-libav.mk | 79 ++---------------------------
>  2 files changed, 7 insertions(+), 74 deletions(-)

Applied to master, after tweaking the help text as suggested by Arnout.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
