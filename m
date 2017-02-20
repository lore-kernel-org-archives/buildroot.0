From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:45:02 +0100
Subject: [Buildroot] [PATCH v5 2/2] keepalived: new package
In-Reply-To: <1487147932-17148-2-git-send-email-apalos@gmail.com>
References: <1487147932-17148-1-git-send-email-apalos@gmail.com>
 <1487147932-17148-2-git-send-email-apalos@gmail.com>
Message-ID: <20170220224502.46a34403@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 10:38:52 +0200, Ilias Apalodimas wrote:
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
> ---
>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/keepalived/Config.in       | 14 ++++++++++++++
>  package/keepalived/keepalived.hash |  3 +++
>  package/keepalived/keepalived.mk   | 32 ++++++++++++++++++++++++++++++++
>  5 files changed, 53 insertions(+)
>  create mode 100644 package/keepalived/Config.in
>  create mode 100644 package/keepalived/keepalived.hash
>  create mode 100644 package/keepalived/keepalived.mk

Applied to next with the following changes:

    [Thomas:
     - rewrap Config.in help text
     - add dependency on !BR2_STATIC_LIBS since the code uses libdl.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
