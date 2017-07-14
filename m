From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 19:30:46 +0200
Subject: [Buildroot] [PATCH] spice: add upstream security fixes for
 CVE-2017-7506
In-Reply-To: <20170714140203.19234-1-peter@korsgaard.com>
References: <20170714140203.19234-1-peter@korsgaard.com>
Message-ID: <20170714193046.5dedfd97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 16:02:03 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-7506 - Possible buffer overflow via invalid monitor
> configurations.
> 
> For more details, see:
> https://marc.info/?l=oss-security&m=150001782924095
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...nect-when-receiving-overly-big-ClientMoni.patch | 75 ++++++++++++++++++++++
>  ...integer-overflows-handling-monitor-config.patch | 31 +++++++++
>  ...buffer-overflows-handling-monitor-configu.patch | 48 ++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 package/spice/0004-reds-Disconnect-when-receiving-overly-big-ClientMoni.patch
>  create mode 100644 package/spice/0005-reds-Avoid-integer-overflows-handling-monitor-config.patch
>  create mode 100644 package/spice/0006-reds-Avoid-buffer-overflows-handling-monitor-configu.patch

Applied to master, thanks. However, you forgot to use "git format-patch
-N" to generate the patches, so I removed the numbering from the patch
titles.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
