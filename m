From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 19:16:07 +0100
Subject: [Buildroot] [PATCH 2/2] strace-aarch64.patch fix for strace
 package
In-Reply-To: <1363641228-29012-1-git-send-email-alexander@mezon.ru>
References: <1363641228-29012-1-git-send-email-alexander@mezon.ru>
Message-ID: <20130319191607.3f695f4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Khryukin,

On Tue, 19 Mar 2013 01:13:48 +0400, Alexander Khryukin wrote:
> 
> Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
> ---
>  package/strace/strace-aarch64.patch | 550 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 550 insertions(+)
>  create mode 100644 package/strace/strace-aarch64.patch
> 
> diff --git a/package/strace/strace-aarch64.patch b/package/strace/strace-aarch64.patch
> new file mode 100644
> index 0000000..1a960fb
> --- /dev/null
> +++ b/package/strace/strace-aarch64.patch
> @@ -0,0 +1,550 @@

Can you keep here the original commit log from the strace Git history?

Also, the title of your patch should be something like: "strace: add
patch for AArch64 support".

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
