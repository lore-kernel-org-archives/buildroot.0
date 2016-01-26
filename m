From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:00:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/iperf3: fix musl build
In-Reply-To: <1453585942-17556-2-git-send-email-bernd.kuhls@t-online.de>
References: <1453585942-17556-1-git-send-email-bernd.kuhls@t-online.de>
 <1453585942-17556-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126230004.465150ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 23 Jan 2016 22:52:22 +0100, Bernd Kuhls wrote:
> Ported -D_GNU_SOURCE from https://dev.openwrt.org/changeset/45103
> Sent patch upstream: https://github.com/esnet/iperf/issues/331

No, this is not submitted upstream. To really submit a patch upstream,
you have to actually submit a pull request to the project, not simply
point to some random Buildroot patchwork entry. If you leave it like
this, the patch is never going to be merged.


> diff --git a/package/iperf3/0002-musl.patch b/package/iperf3/0002-musl.patch
> new file mode 100644
> index 0000000..764c00b
> --- /dev/null
> +++ b/package/iperf3/0002-musl.patch
> @@ -0,0 +1,27 @@
> +Fix musl build
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Really, I want to see Git formatted patches for packages hosted on Git
repositories upstream.

Could you rework things with this in mind ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
