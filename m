From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 23:56:11 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20140307235611.7558047d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Mon, 23 Dec 2013 10:37:24 +0100, Alexandre Belloni wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  package/Config.in                                  |   1 +
>  package/bluez5_utils/Config.in                     |  16 ++++
>  .../bluez5_utils-5.12-enable_cg2900.patch          | 106 +++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk               |  31 ++++++
>  package/bluez_utils/Config.in                      |   8 +-
>  5 files changed, 161 insertions(+), 1 deletion(-)
>  create mode 100644 package/bluez5_utils/Config.in
>  create mode 100644 package/bluez5_utils/bluez5_utils-5.12-enable_cg2900.patch
>  create mode 100644 package/bluez5_utils/bluez5_utils.mk

Can you resend an updated version of this patch, that takes into
account the review comments you have received? It would be great to
have bluez5_utils in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
