From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2015 15:59:10 +0100
Subject: [Buildroot] [PATCH v2] nettle: bump to version 3.1.1
In-Reply-To: <1444055141-23068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444055141-23068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151005155910.10560ccd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  5 Oct 2015 11:25:41 -0300, Gustavo Zacarias wrote:
> API is now compatible with nettle 2.7.x
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...patch => 0001-disable-testsuite-examples.patch} |  0
>  package/nettle/0001-fix-shared-only-build.patch    | 75 ----------------------
>  package/nettle/nettle.hash                         |  2 +-
>  package/nettle/nettle.mk                           | 15 ++---
>  4 files changed, 5 insertions(+), 87 deletions(-)
>  rename package/nettle/{0002-disable-testsuite-examples.patch => 0001-disable-testsuite-examples.patch} (100%)
>  delete mode 100644 package/nettle/0001-fix-shared-only-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
