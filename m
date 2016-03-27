From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Mar 2016 17:46:30 -0300
Subject: [Buildroot] [PATCH V3 2/2] Add custom Subversion repository
 support for package linux
References: <1459099817-4614-2-git-send-email-susundberg@gmail.com>
Message-ID: <56f846a66edd1_541bc1f82c68250@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pauli,

> [PATCH V3 2/2] Add custom Subversion repository support for package linux
Same comment from the other patch. See
git log -- linux

On Sun, Mar 27, 2016 at 02:30 PM, Pauli Sundberg <susundberg@gmail.com> wrote:

> from: Pauli Sundberg <susundberg@gmail.com>
> date: Sun, Mar 27 08:30 PM +03:00 2016
> to: buildroot at buildroot.org
> cc: Pauli Sundberg <susundberg@gmail.com>
> subject: [Buildroot] [PATCH V3 2/2] Add custom Subversion repository support for package linux
> 
> Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
> ---
>  linux/Config.in | 12 +++++++++---
>  linux/linux.mk  |  3 +++
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 93968cd..dd21661 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -63,6 +63,12 @@ config BR2_LINUX_KERNEL_CUSTOM_HG
>  	  This option allows Buildroot to get the Linux kernel source
>  	  code from a Mercurial repository.
>  
> +config BR2_LINUX_KERNEL_CUSTOM_SVN
> +	bool "Custom Subversion repository"
> +	help
> +	  This option allows Buildroot to get the Linux kernel source
> +	  code from a subversion repository.

You could use "Subversion" instead of "subversion" for consistence.

> +
>  config BR2_LINUX_KERNEL_CUSTOM_LOCAL
>  	bool "Local directory"
>  	help

[snip]

Regards,
Ricardo
