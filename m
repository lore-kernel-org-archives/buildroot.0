From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 20:38:12 +0200
Subject: [Buildroot] [PATCH] tslib: bump version to 1.1
In-Reply-To: <1379574777-9399-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 19 Sep 2013 09:12:57
 +0200")
References: <1379574777-9399-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87wqmcfyi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> ---
 yegorslists>  package/tslib/tslib.mk |    2 +-
 yegorslists>  1 files changed, 1 insertions(+), 1 deletions(-)

 yegorslists> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
 yegorslists> index 7f5aa21..ebc33b2 100644
 yegorslists> --- a/package/tslib/tslib.mk
 yegorslists> +++ b/package/tslib/tslib.mk
 yegorslists> @@ -4,7 +4,7 @@
 yegorslists>  #
 yegorslists>  ################################################################################
 
 yegorslists> -TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
 yegorslists> +TSLIB_VERSION = e2e03ef7192a7e0a84f725522be17a61b21b41c5

It makes more sense to use the 1.1 tag.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
