From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:41:32 +0100
Subject: [Buildroot] [PATCH 29/33] ltp-testsuite: add license info
In-Reply-To: <1353543503-8952-30-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-30-git-send-email-s.martin49@gmail.com>
Message-ID: <50B130FC.9080904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/ltp-testsuite/ltp-testsuite.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index c6b34f0..72d3a08 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -6,5 +6,7 @@
>   LTP_TESTSUITE_VERSION = 20101031
>   LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
>   LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
> +LTP_TESTSUITE_LICENSE = GPLv2
> +LTP_TESTSUITE_LICENSE_FILES = COPYING

  Parts are GPLv2 and parts are GPLv2+, so I'd put both.

  Regards,
  Arnout

>
>   $(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
