From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:07:09 +0200
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_arc
In-Reply-To: <1375284419-2958-1-git-send-email-mjonker@synopsys.com>
References: <1375284419-2958-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130731180709.14d06593@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Wed, 31 Jul 2013 17:26:59 +0200, Mischa Jonker wrote:
> ARC is not supported yet in libnspr.
> 
> v2: Propagate to ecryptfs-utils as well
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>  package/ecryptfs-utils/Config.in |    1 +
>  package/libnspr/Config.in        |    1 +
>  package/libnss/Config.in         |    1 +
>  3 files changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
