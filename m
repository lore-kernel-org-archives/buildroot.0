From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 07:45:56 -0800
Subject: [Buildroot] [PATCH 08/33] owl-linux: update help text about
	linux kernel dependencies.
In-Reply-To: <1353543503-8952-9-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:17:58 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-9-git-send-email-s.martin49@gmail.com>
Message-ID: <87boefaybv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/owl-linux/Config.in | 2 ++
 Samuel>  1 file changed, 2 insertions(+)

 Samuel> diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
 Samuel> index f6e18d5..1dcf5f1 100644
 Samuel> --- a/package/owl-linux/Config.in
 Samuel> +++ b/package/owl-linux/Config.in
 Samuel> @@ -6,6 +6,8 @@ config BR2_PACKAGE_OWL_LINUX
 Samuel>  	help
 Samuel>  	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
 
 Samuel> +	  owl-linux requires the hidden kernel option WIRELESS_EXT enabled.
 Samuel> +

Committed, thanks. Perhaps it would make sense to automatically enable
that option in linux.mk when owl is enabled?

-- 
Bye, Peter Korsgaard
