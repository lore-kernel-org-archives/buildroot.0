From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:35:10 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-base: alsa now needs seq
In-Reply-To: <1459024253-28652-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459024253-28652-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160326213510.125d7d6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Mar 2016 17:30:53 -0300, Gustavo Zacarias wrote:
> A seq (midi) source has been added to gst-plugins-base 1.8.x hence we
> need to account for it, so select BR2_PACKAGE_ALSA_LIB_SEQ. Fixes:
> http://autobuild.buildroot.net/results/474/474e4b9bc3a44224302d0576cf1c0de7ce709f1a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-plugins-base/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
