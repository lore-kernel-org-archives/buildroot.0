From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Dec 2012 14:52:59 +0100
Subject: [Buildroot] [PATCH 2/3] pcmanfm: use a download URL from
	downloads.sourceforge.net
In-Reply-To: <1355908403-27224-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Dec 2012 10:13:22 +0100")
References: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1355908403-27224-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hani4090.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/pcmanfm/pcmanfm.mk |    2 +-
 Thomas>  1 file changed, 1 insertion(+), 1 deletion(-)

 Thomas> diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
 Thomas> index e4c23ec..8eaa485 100644
 Thomas> --- a/package/pcmanfm/pcmanfm.mk
 Thomas> +++ b/package/pcmanfm/pcmanfm.mk
 Thomas> @@ -5,7 +5,7 @@
 Thomas>  #############################################################
 Thomas>  PCMANFM_VERSION = 0.3.5.9
 Thomas>  PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 Thomas> -PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 Thomas> +PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%200.3.5.9/

I changed this to use PCMANFM_VERSION instead of hardcoding 0.3.5.9 here
and committed all 3, thanks.

-- 
Bye, Peter Korsgaard
