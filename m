From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 21:02:02 +0100
Subject: [Buildroot] [PATCH 5/7] libusb: add host variant
In-Reply-To: <f3a4170c4cadff973bd8b27cbb916007e47d72bf.1327772556.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 28 Jan 2012 18:42:53 +0100")
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <f3a4170c4cadff973bd8b27cbb916007e47d72bf.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sjit80n9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Thomas> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  package/libusb/libusb.mk |    3 +++
 Thomas>  1 files changed, 3 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
 Thomas> index af75f5f..b3ca353 100644
 Thomas> --- a/package/libusb/libusb.mk
 Thomas> +++ b/package/libusb/libusb.mk
 Thomas> @@ -10,4 +10,7 @@ LIBUSB_DEPENDENCIES = host-pkg-config
 Thomas>  LIBUSB_INSTALL_STAGING = YES
 Thomas>  LIBUSB_INSTALL_TARGET = YES
 
 Thomas> +HOST_LIBUSB_DEPENDENCIES = host-pkg-config

Same comments as libusb-compat. Committed, thanks.

-- 
Bye, Peter Korsgaard
