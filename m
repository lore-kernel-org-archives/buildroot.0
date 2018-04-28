From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 19:03:36 +0200
Subject: [Buildroot] [PATCH 1/1] boinc: replace systemd script
In-Reply-To: <20180428142417.27268-1-fontaine.fabrice@gmail.com>
References: <20180428142417.27268-1-fontaine.fabrice@gmail.com>
Message-ID: <20180428190336.29a0d655@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 16:24:17 +0200, Fabrice Fontaine wrote:
> Remove buildroot systemd script to use the script embedded by boinc
> since version 7.9.1.
> Set BOINC_USERS to be able to use this script
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boinc/boinc-client.service | 10 ----------
>  package/boinc/boinc.mk             |  6 ++++--
>  2 files changed, 4 insertions(+), 12 deletions(-)
>  delete mode 100644 package/boinc/boinc-client.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
