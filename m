From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 13:32:20 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: update to 1.0.2
In-Reply-To: <20150419140355.GA7043@waldemar-brodkorb.de>
References: <20150419140355.GA7043@waldemar-brodkorb.de>
Message-ID: <20150421133220.4c819d7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 19 Apr 2015 16:03:56 +0200, Waldemar Brodkorb wrote:
> Following problems found by buildroot should be fixed:
>  * static python2 compile (there is still a general problem, not related to uClibc-ng)
>  * postgresql configure hickup (link warnings got removed)
>  * samba runtime problems (RPATH in executables are respected)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...selection-better-do-it-in-your-build-syst.patch |   60 ----------------
>  .../0001-fix-static-linking-of-pthread-apps.patch  |   72 ++++++++++++++++++++
>  package/uclibc/Config.in                           |    2 +-
>  package/uclibc/uClibc-ng.config                    |    4 +-
>  package/uclibc/uclibc.hash                         |    2 +-
>  5 files changed, 77 insertions(+), 63 deletions(-)
>  delete mode 100644 package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
>  create mode 100644 package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
