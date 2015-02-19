From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:32:04 +0100
Subject: [Buildroot] [PATCH 1/2] crda: bump to version 3.18
In-Reply-To: <1424280157-6849-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424280157-6849-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150219213204.0132936f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Feb 2015 14:22:36 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...d-DESTDIR-support-in-install-libreg-rules.patch | 41 ----------------------
>  package/crda/0002-drop-ldconfig-call.patch         | 15 ++++++++
>  package/crda/crda.hash                             |  2 +-
>  package/crda/crda.mk                               |  2 +-
>  4 files changed, 17 insertions(+), 43 deletions(-)
>  delete mode 100644 package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch
>  create mode 100644 package/crda/0002-drop-ldconfig-call.patch

Both patches applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
