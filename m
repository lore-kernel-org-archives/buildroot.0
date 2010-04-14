From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 10:16:46 +0200
Subject: [Buildroot] [PATCH 27/41] linux-fusion: drop target
	installation option (it's on by default)
In-Reply-To: <1271199974-30434-28-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:06:00 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-28-git-send-email-llandwerlin@gmail.com>
Message-ID: <877hoah2j5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/linux-fusion/linux-fusion.mk |    1 -
 llandwerlin>  1 files changed, 0 insertions(+), 1 deletions(-)

 llandwerlin> diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
 llandwerlin> index abce465..4dbf45e 100644
 llandwerlin> --- a/package/linux-fusion/linux-fusion.mk
 llandwerlin> +++ b/package/linux-fusion/linux-fusion.mk
 llandwerlin> @@ -7,7 +7,6 @@ LINUX_FUSION_VERSION = 8.1.1
 llandwerlin>  LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 llandwerlin>  LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 llandwerlin>  LINUX_FUSION_INSTALL_STAGING = YES
 llandwerlin> -LINUX_FUSION_INSTALL_TARGET = YES

You might as well just not add it in patch #26.

-- 
Bye, Peter Korsgaard
