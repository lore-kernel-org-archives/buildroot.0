From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Sep 2014 14:23:14 +0100
Subject: [Buildroot] [PATCH] hdparm: bump to version 9.45
In-Reply-To: <1411994681-19071-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411994681-19071-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54295D42.9010702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/29/2014 01:44 PM, Gustavo Zacarias wrote:
> Also add hash file.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/hdparm/hdparm.hash | 3 +++
>   package/hdparm/hdparm.mk   | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>   create mode 100644 package/hdparm/hdparm.hash
>
> diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
> new file mode 100644
> index 0000000..12f8e07
> --- /dev/null
> +++ b/package/hdparm/hdparm.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/hdparm/files/hdparm/
> +md5	1c75d0751a44928b6c4bc81fb16d7fe8	hdparm-9.45.tar.gz
> +sha1	232855a97df0a28ddeeff9325814517668877f6c	hdparm-9.45.tar.gz
> diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
> index 0ca3c39..2a113d2 100644
> --- a/package/hdparm/hdparm.mk
> +++ b/package/hdparm/hdparm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -HDPARM_VERSION = 9.43
> +HDPARM_VERSION = 9.45
>   HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
>   HDPARM_LICENSE = BSD-Style
>   HDPARM_LICENSE_FILES = LICENSE.TXT
>

Dear Gustavo,

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks,

-- 
Vincent
