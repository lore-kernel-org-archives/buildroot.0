From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 22:14:09 +0200
Subject: [Buildroot] [PATCH 08/11] ramspeed: define license
In-Reply-To: <1373477150-10251-8-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Wed, 10 Jul 2013 10:25:47 -0700")
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
 <1373477150-10251-8-git-send-email-gilles.talis@gmail.com>
Message-ID: <878v1efa0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/ramspeed/ramspeed.mk |    2 ++
 Gilles>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gilles> diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
 Gilles> index f87f8bc..373dd55 100644
 Gilles> --- a/package/ramspeed/ramspeed.mk
 Gilles> +++ b/package/ramspeed/ramspeed.mk
 Gilles> @@ -7,6 +7,8 @@
 Gilles>  RAMSPEED_VERSION = 2.6.0
 Gilles>  RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
 Gilles>  RAMSPEED_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
 Gilles> +RAMSPEED_LICENSE = Alasir License
 Gilles> +RAMSPEED_LICENSE_FILES = LICENSE

Same here (LICENCE).

-- 
Bye, Peter Korsgaard
