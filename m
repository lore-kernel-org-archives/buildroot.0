From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 19:23:18 +0100
Subject: [Buildroot] [PATCH v4 2/4] am33x-cm3: update to latest version
In-Reply-To: <1392021600-32293-3-git-send-email-anders@chargestorm.se>
References: <1392021600-32293-1-git-send-email-anders@chargestorm.se>
 <1392021600-32293-3-git-send-email-anders@chargestorm.se>
Message-ID: <20140210192318.0cfa580b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Mon, 10 Feb 2014 09:39:58 +0100, Anders Darander wrote:
> This goes hand-in-hand with the kernel update.
> The version is taken from meta-ti.
> 
> The new kernel version, 3.12, requires a newer PM FW.
> 
> This should correspond to v05.00.00.02, though that tag
> has not been pushed...
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch | 16 ++++++++++------
>  package/am33x-cm3/am33x-cm3.mk                      |  3 ++-
>  2 files changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> diff --git a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
> index 77ba11c..f3cdb5e 100644
> --- a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
> +++ b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
> @@ -11,16 +11,20 @@ Fix this by explicitly indicating -march=armv7-m.
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  
> +Updated the patch to the latest version of the Makefile
> +
> +Signed-off-by: Anders Darander <anders@chargestorm.se>

Anders, if you know the upstream maintainers of this software, do not
hesitate to send the patch upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
