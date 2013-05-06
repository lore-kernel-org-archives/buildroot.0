From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 23:58:12 +0200
Subject: [Buildroot] [PATCH] Update webkit download URL
In-Reply-To: <1367857179.4665.19.camel@feynman.coloradoengineeringinc.com>
 (Michael J. Hammel's message of "Mon, 06 May 2013 10:19:39 -0600")
References: <1367857179.4665.19.camel@feynman.coloradoengineeringinc.com>
Message-ID: <87a9o76aa3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael J Hammel <buildroot@graphics-muse.org> writes:

 Michael> Signed-off-by: Michael J. Hammel <mjhammel@graphics-muse.org>
 Michael> ---
 Michael>  package/webkit/webkit.mk |    2 +-
 Michael>  1 files changed, 1 insertions(+), 1 deletions(-)

 Michael> diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
 Michael> index d37601f..264bcad 100644
 Michael> --- a/package/webkit/webkit.mk
 Michael> +++ b/package/webkit/webkit.mk
 Michael> @@ -5,7 +5,7 @@
 Michael>  #############################################################
 
 Michael>  WEBKIT_VERSION = 1.2.7
 Michael> -WEBKIT_SITE = http://www.webkitgtk.org
 Michael> +WEBKIT_SITE = http://www.webkitgtk.org/releases
 Michael>  WEBKIT_INSTALL_STAGING = YES
 Michael>  WEBKIT_DEPENDENCIES = host-flex host-bison host-gperf icu libcurl
 Michael> libxml2 \

Your mailer has word wrapped the patch, so I had to fix it up
manually. Please consider using 'git send-email' in the future.

-- 
Bye, Peter Korsgaard
