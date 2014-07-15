From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:22:20 +0200
Subject: [Buildroot] [PATCH v14 03/20] package/mesa3d: add dependency
 xproto_presentproto
In-Reply-To: <1405451955-10204-4-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
 <1405451955-10204-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140715212220.5244b728@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 15 Jul 2014 21:18:58 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in |    1 +
>  package/mesa3d/mesa3d.mk |    1 +
>  2 files changed, 2 insertions(+)

Please add a justification about this change in the commit log. Is it
needed following the mesa3d bump? In this case, it should be part of
the patch bumping mesa3d.

Bernd, a good rule of thumb is *all* patches should have a commit log.
So whenever you're about to send a series, please review the commit log
of your patches, and make sure all of them have a non-empty commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
