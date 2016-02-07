From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 12:24:26 +0100
Subject: [Buildroot] [PATCH v2] package/iperf3: fix musl build
In-Reply-To: <1454178476-3057-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454178476-3057-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207122426.43d5bdab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 19:27:56 +0100, Bernd Kuhls wrote:
> Ported -D_GNU_SOURCE from https://dev.openwrt.org/changeset/45103
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../iperf3/0002-Fix-build-using-musl-libc.patch    | 43 ++++++++++++++++++++++
>  package/iperf3/iperf3.mk                           |  2 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/iperf3/0002-Fix-build-using-musl-libc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
