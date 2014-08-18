From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Aug 2014 13:50:57 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWWdZF12uQBX487i71S8JLSqDuFf3tRtLfPhK=wbJd-Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Aug 18, 2014 at 11:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
> diff --git a/package/getent/getent.mk b/package/getent/getent.mk
> new file mode 100644
> index 0000000..dd08478
> --- /dev/null
> +++ b/package/getent/getent.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# getent
> +#
> +################################################################################
> +
> +# source included in Buildroot
> +GETENT_SOURCE =
> +
> +GETENT_VERSION = buildroot-$(BR2_VERSION)
> +GETENT_LICENSE = LGPLv2.1+

How do you conclude this license?
Isn't this dependent on the case glibc versus uclibc/musl ? Or do each
of these use the same license?
Also, shouldn't we specify GETENT_LICENSE_FILES and make sure the
appropriate license text is present?

Best regards,
Thomas
