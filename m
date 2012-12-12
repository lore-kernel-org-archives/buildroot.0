From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 09:55:28 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.52.0
In-Reply-To: <1355298611-1770-2-git-send-email-victor.hiairrassary.ml@gmail.com>
 (victor hiairrassary ml's message of "Wed, 12 Dec 2012 08:50:11
 +0100")
References: <1355298611-1770-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 <1355298611-1770-2-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <87hanrodj3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "victor" == victor hiairrassary ml <victor.hiairrassary.ml@gmail.com> writes:

 victor> Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
 victor> ---
 victor>  package/boost/Config.in | 4 ++++
 victor>  package/boost/boost.mk  | 4 ++--
 victor>  2 files changed, 6 insertions(+), 2 deletions(-)

 victor> diff --git a/package/boost/Config.in b/package/boost/Config.in
 victor> index 8798367..58e62a0 100644
 victor> --- a/package/boost/Config.in
 victor> +++ b/package/boost/Config.in
 victor> @@ -1,9 +1,13 @@
 victor>  comment "boost requires a toolchain with C++ support enabled"
 victor>  	depends on !BR2_INSTALL_LIBSTDCPP
 
 victor> +comment "boost requires a toolchain with large file support enabled"
 victor> +	depends on !BR2_LARGEFILE
 victor> +

I've merged this comment with the above and committed, thanks.

-- 
Bye, Peter Korsgaard
