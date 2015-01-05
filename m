From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 15:16:31 +0100
Subject: [Buildroot] [PATCH v2] package/dvb-app: handle static/shared
 only build
In-Reply-To: <1420375526-8806-1-git-send-email-romain.naour@openwide.fr>
References: <1420375526-8806-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150105151631.3862bb99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  4 Jan 2015 13:45:26 +0100, Romain Naour wrote:
> Also remove tests since they require static libraries.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove tests (ThomasP)
>     rework static/shared handling logic
> ---
>  .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
>  .../dvb-apps/0003-support-static-only-build.patch  | 20 -------------
>  package/dvb-apps/0004-Makefile-remove-test.patch   | 27 +++++++++++++++++
>  package/dvb-apps/dvb-apps.mk                       |  4 ++-
>  4 files changed, 65 insertions(+), 21 deletions(-)
>  create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
>  delete mode 100644 package/dvb-apps/0003-support-static-only-build.patch
>  create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch

Patch marked as Changes Requested in patchwork, following the comments
made by Yann. Romain, can you submit an updated version?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
