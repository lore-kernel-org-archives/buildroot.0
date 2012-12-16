From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 20:36:38 +0100
Subject: [Buildroot] [PATCH 03/19] package/celt051: new package
In-Reply-To: <134bb23d2dcb4fdf0686458f0d49a6eb90df3ab0.1355676845.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 16 Dec 2012 17:56:10 +0100")
References: <cover.1355676845.git.yann.morin.1998@free.fr>
 <cover.1355676845.git.yann.morin.1998@free.fr>
 <134bb23d2dcb4fdf0686458f0d49a6eb90df3ab0.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <874njleqm1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>
 Yann> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Yann> ---
 Yann>  package/multimedia/Config.in         |    1 +
 Yann>  package/multimedia/celt051/Config.in |   15 +++++++++++++++
 Yann>  package/multimedia/celt051/celt.mk   |   30 ++++++++++++++++++++++++++++++
 Yann>  3 files changed, 46 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/multimedia/celt051/Config.in
 Yann>  create mode 100644 package/multimedia/celt051/celt.mk

 Yann> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Yann> index 273d9bc..5e8d60c 100644
 Yann> --- a/package/multimedia/Config.in
 Yann> +++ b/package/multimedia/Config.in
 Yann> @@ -2,6 +2,7 @@ menu "Audio and video applications"
 Yann>  source "package/multimedia/alsa-utils/Config.in"
 Yann>  source "package/multimedia/aumix/Config.in"
 Yann>  source "package/multimedia/bellagio/Config.in"
 Yann> +source "package/multimedia/celt051/Config.in"

CELT is primarily a library, so I've moved this to Libraries ->
Audio/Sound similar to E.G. opus - Committed, thanks.

-- 
Bye, Peter Korsgaard
