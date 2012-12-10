From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 22:33:07 +0100
Subject: [Buildroot] [PATCH] tslib: add license info
In-Reply-To: <1354876163-30452-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Fri, 7 Dec 2012 11:29:23 +0100")
References: <1354876163-30452-1-git-send-email-sho@relinux.de>
Message-ID: <87y5h5pp7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 Stephan> ---
 Stephan>  package/tslib/tslib.mk |    3 +++
 Stephan>  1 files changed, 3 insertions(+), 0 deletions(-)

 Stephan> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
 Stephan> index b10b5ec..9b51015 100644
 Stephan> --- a/package/tslib/tslib.mk
 Stephan> +++ b/package/tslib/tslib.mk
 Stephan> @@ -5,6 +5,9 @@
 Stephan>  #############################################################
 Stephan>  TSLIB_VERSION = 412d99d
 Stephan>  TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
 Stephan> +TSLIB_LICENSE = LGPLv2
 Stephan> +TSLIB_LICENSE_FILES = COPYING

Committed as LGPL, thanks.

-- 
Bye, Peter Korsgaard
