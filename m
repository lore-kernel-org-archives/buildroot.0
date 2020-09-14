From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:22:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: fix CVE-2020-5208
In-Reply-To: <20200914132056.16228-1-heiko.thiery@gmail.com>
References: <20200914132056.16228-1-heiko.thiery@gmail.com>
Message-ID: <20200914212254.52d8649c@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 15:20:55 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add several upstream patches that are made to fix this CVE. Since there
> is still no dated plan to release a new version add this bunch of
> patches.
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...-Fix-buffer-overflow-vulnerabilities.patch | 132 ++++++++++++++++
>  ...uffer-overflow-in-ipmi_spd_print_fru.patch |  52 +++++++
>  ...er-overflow-in-ipmi_get_session_info.patch |  52 +++++++
>  .../0011-channel-Fix-buffer-overflow.patch    |  41 +++++
>  ...er-overflows-in-get_lan_param_select.patch |  92 ++++++++++++
>  ...u-sdr-Fix-id_string-buffer-overflows.patch | 141 ++++++++++++++++++
>  package/ipmitool/ipmitool.mk                  |   8 +
>  7 files changed, 518 insertions(+)
>  create mode 100644 package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
>  create mode 100644 package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
>  create mode 100644 package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
>  create mode 100644 package/ipmitool/0011-channel-Fix-buffer-overflow.patch
>  create mode 100644 package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
>  create mode 100644 package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
