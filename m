From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 20:57:44 +0100
Subject: [Buildroot] [PATCH 3/7] libftdi: add host variant
In-Reply-To: <ad77b79da278e02b815d053805ff555b378b0949.1327772556.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 28 Jan 2012 18:42:51 +0100")
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <ad77b79da278e02b815d053805ff555b378b0949.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871uqd9fev.fsf@macbook.be.48ers.dk>
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
 Thomas>  package/libftdi/libftdi.mk |    3 +++
 Thomas>  1 files changed, 3 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
 Thomas> index 55481d9..2c0afe7 100644
 Thomas> --- a/package/libftdi/libftdi.mk
 Thomas> +++ b/package/libftdi/libftdi.mk
 Thomas> @@ -20,4 +20,7 @@ else
 Thomas>  LIBFDTI_CONF_OPT += --disable-libftdipp
 Thomas>  endif
 
 Thomas> +HOST_LIBFTDI_DEPENDENCIES = host-libusb-compat host-libusb

This line is no longer needed, so I dropped it. Other than that it looks
fine - Committed, thanks.

-- 
Bye, Peter Korsgaard
