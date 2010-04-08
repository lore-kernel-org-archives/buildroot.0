From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Apr 2010 21:47:03 +0200
Subject: [Buildroot] [PATCH 07/16] xproto_dri2proto: bump version
In-Reply-To: <1270126006-22405-7-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Thu, 1 Apr 2010 13:46:37 +0100")
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
	<1270126006-22405-7-git-send-email-will_wagner@carallon.com>
Message-ID: <87wrwhn2vc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>
 Will> ---
 Will>  package/x11r7/xproto_dri2proto/Config.in           |    2 +-
 Will>  package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 Will>  2 files changed, 2 insertions(+), 2 deletions(-)

Committed, thanks.

 Will> diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
 Will> index 4ab5ccd..a5c82b2 100644
 Will> --- a/package/x11r7/xproto_dri2proto/Config.in
 Will> +++ b/package/x11r7/xproto_dri2proto/Config.in
 Will> @@ -1,5 +1,5 @@
 Will>  config BR2_PACKAGE_XPROTO_DRI2PROTO
 Will>  	bool "dri2proto"
 Will>  	help
 Will> -	  dri2proto 2.1
 Will> +	  dri2proto 2.3

This is just noice without any real advantage to the users, so I removed
this.

-- 
Bye, Peter Korsgaard
