From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Oct 2013 15:15:21 +0200
Subject: [Buildroot] [PATCH 4/4] ngrep: add license information
In-Reply-To: <1381759541-15243-4-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Mon, 14 Oct 2013 16:05:41 +0200")
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
 <1381759541-15243-4-git-send-email-phil@zankapfel.net>
Message-ID: <87d2n6k74m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

 Phil> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
 Phil> ---
 Phil>  package/ngrep/ngrep.mk |    2 ++
 Phil>  1 file changed, 2 insertions(+)

 Phil> diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
 Phil> index 99b8f46..e25d3a2 100644
 Phil> --- a/package/ngrep/ngrep.mk
 Phil> +++ b/package/ngrep/ngrep.mk
 Phil> @@ -7,6 +7,8 @@
 Phil>  NGREP_VERSION = 1.45
 Phil>  NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 Phil>  NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
 Phil> +NGREP_LICENSE = BSD-Style
 Phil> +NGREP_LICENSE_FILES = LICENSE.txt

Committed with the license changed to BSD-4c-like, thanks.

-- 
Bye, Peter Korsgaard
