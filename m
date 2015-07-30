From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:27:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/eudev: add libselinux
 dependency
In-Reply-To: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
References: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150730232747.50bacd39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 30 Jul 2015 18:01:37 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
> v2: Don't disable selinux support for musl toolchains (Thomas)
> ---
>  package/eudev/eudev.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
