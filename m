From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 22:13:01 +0200
Subject: [Buildroot] [PATCH 07/11] ramsmp: define license
In-Reply-To: <1373477150-10251-7-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Wed, 10 Jul 2013 10:25:46 -0700")
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
 <1373477150-10251-7-git-send-email-gilles.talis@gmail.com>
Message-ID: <87d2qqfa2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/ramsmp/ramsmp.mk |    2 ++
 Gilles>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gilles> diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
 Gilles> index 1b44402..5fb0542 100644
 Gilles> --- a/package/ramsmp/ramsmp.mk
 Gilles> +++ b/package/ramsmp/ramsmp.mk
 Gilles> @@ -7,6 +7,8 @@
 Gilles>  RAMSMP_VERSION = 3.5.0
 Gilles>  RAMSMP_SITE = http://www.alasir.com/software/ramspeed
 Gilles>  RAMSMP_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
 Gilles> +RAMSMP_LICENSE = Alasir License
 Gilles> +RAMSMP_LICENSE_FILES = LICENSE

License file is actually called 'LICENCE'.

-- 
Bye, Peter Korsgaard
