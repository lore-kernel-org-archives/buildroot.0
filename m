From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:50:55 +0200
Subject: [Buildroot] [PATCH] wayland: needs threads
In-Reply-To: <1376328877-24327-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376328877-24327-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130813115055.1a7bd1e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 12 Aug 2013 14:34:37 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/383/383c6ac297250f87db9d03afa38d45b2c1adcb47/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/multimedia/gst1-plugins-bad/Config.in | 1 +
>  package/wayland/Config.in                     | 4 ++++
>  package/weston/Config.in                      | 1 +
>  3 files changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
