From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:22:06 +0200
Subject: [Buildroot] [PATCH 08/23] kernel-headers: migrate to the
 package infrastructure
In-Reply-To: <87vc4rpe29.fsf@dell.be.48ers.dk>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vc4rpe29.fsf@dell.be.48ers.dk>
Message-ID: <20130703232206.49270de5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 03 Jul 2013 22:46:06 +0200, Peter Korsgaard wrote:

>  Thomas> +++ b/package/linux-headers/linux-headers.mk
>  Thomas> @@ -0,0 +1,31 @@
>  Thomas> +#############################################################
>  Thomas> +#
>  Thomas> +# linux-headers
>  Thomas> +#
>  Thomas> +#############################################################
> 
> These should be 80 chars.
> 
> Committed with that fixed, thanks.

Gaah, yes, thanks. This was written before Alexandre converted all the
packages to 80 chars. While I remembered to fix the
gcc-{initial,intermediate,final} packages, I forgot this one. Thanks
for fixing it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
