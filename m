From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:46:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/vnstat: New package
In-Reply-To: <1420897126-17013-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420897126-17013-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150110154608.574fcc1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 10 Jan 2015 14:38:46 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in          |    1 +
>  package/vnstat/Config.in   |   11 +++++++++++
>  package/vnstat/vnstat.hash |    2 ++
>  package/vnstat/vnstat.mk   |   28 ++++++++++++++++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 package/vnstat/Config.in
>  create mode 100644 package/vnstat/vnstat.hash
>  create mode 100644 package/vnstat/vnstat.mk

Thanks, applied, with minor changes:

    [Thomas:
      - Rename the VNSTAT_INSTALL_VNSTATI to VNSTAT_INSTALL_VNSTATI_CMDS,
        and use 'define ... endef'.
      - Use full paths for the destinations when using $(INSTALL)]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
