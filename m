From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 10:40:31 +0100
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
References: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140204104031.30100cc9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 19 Mar 2013 14:05:26 +0400, Alexey Brodkin wrote:
> From: Alexey Brodkin <alexey.brodkin@synopsys.com>
> 
> Based on "[PATCHv6] vlc: New package" found here http://patchwork.ozlabs.org/patch/171335/
> 
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> Signed-off-by: Alexey Brodkin <alexey.brodkin@synopsys.com>
> ---
>  package/multimedia/Config.in                  |    1 +
>  package/multimedia/vlc/Config.in              |  305 ++++++++++++++++++++
>  package/multimedia/vlc/vlc-uclibc-fixes.patch |   27 ++
>  package/multimedia/vlc/vlc.mk                 |  372 +++++++++++++++++++++++++
>  4 files changed, 705 insertions(+)
>  create mode 100644 package/multimedia/vlc/Config.in
>  create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
>  create mode 100644 package/multimedia/vlc/vlc.mk

We have merged a separate proposal to introduce VLC recently, see:
http://git.buildroot.net/buildroot/tree/package/vlc/.

It does not include as many features as the patch you were proposing,
but your patch was introducing so many configuration options at once
that it was a bit hard to do some good testing of it. Therefore, we've
merged something slightly simpler, and we invite you do send follow-up
patches to improve what we have now to support the additional features
that you think are missing.

Thanks a lot for your contribution, and sorry for the time it took to
get a VLC package merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
