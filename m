From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:43:29 +0200
Subject: [Buildroot] [PATCH v1] racehound: fix kernel module compile
In-Reply-To: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
References: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150726184329.56ac43ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 16 Jul 2015 23:24:12 +0200, Peter Seiderer wrote:
> - check for linux kernel >= 3.14
> - add cross compile enviornment for linux kernel compile
> - add additional kernel config hint (CONFIG_KALLSYMS_ALL)
> - fix kernel module install path
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...install-path-lib-instead-of-usr-lib-prefi.patch | 26 ++++++++++++++++++++++
>  package/racehound/Config.in                        |  5 ++++-
>  package/racehound/racehound.mk                     |  7 +++++-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch

Applied with some changes:

    [Thomas:
     - fix Config.in dependency logic for the comment on the kernel
       version, as noticed by Baruch.
     - minor improvements in the .mk file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
