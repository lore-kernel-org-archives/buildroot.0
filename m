From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 20 May 2014 16:26:35 +0200
Subject: [Buildroot] [PATCH] oprofile: bump to version 0.9.9
In-Reply-To: <1400592658-14517-1-git-send-email-abrodkin@synopsys.com>
References: <1400592658-14517-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <CAAXf6LWQbOQBDgT7-rEQjT=vxCnJMhm4DDN9AF2r9wbRe1dNHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 20, 2014 at 3:30 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 07a8ec9..b69e974 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPROFILE_VERSION = 0.9.8
> +OPROFILE_VERSION = 0.9.9
>  OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
>  OPROFILE_LICENSE = GPLv2+
>  OPROFILE_LICENSE_FILES = COPYING
> @@ -17,6 +17,7 @@ OPROFILE_AUTORECONF = YES
>  OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
>  OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
>  OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
> +OPRIFILE_BINARIES += pe_counting/ocount

This should be OPROFILE (typo)

Best regards,
Thomas
