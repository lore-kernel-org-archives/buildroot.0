From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 May 2011 12:48:00 +0200
Subject: [Buildroot] [PATCH] ffmpeg: ffmpeg binary requires swscale
In-Reply-To: <1305233238-324-1-git-send-email-mike@mikebwilliams.com> (Mike
	Williams's message of "Thu, 12 May 2011 16:47:18 -0400")
References: <1305233238-324-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <87wrhukhb3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:

 Mike> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
 Mike> ---
 Mike>  package/multimedia/ffmpeg/Config.in |    1 +
 Mike>  1 files changed, 1 insertions(+), 0 deletions(-)

 Mike> diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
 Mike> index 7a9513c..d11233e 100644
 Mike> --- a/package/multimedia/ffmpeg/Config.in
 Mike> +++ b/package/multimedia/ffmpeg/Config.in
 Mike> @@ -27,6 +27,7 @@ config BR2_PACKAGE_FFMPEG_NONFREE
 
 Mike>  config BR2_PACKAGE_FFMPEG_FFMPEG
 Mike>  	bool "Build ffmpeg (the command line application)"
 Mike> +	select BR2_PACKAGE_FFMPEG_SWSCALE

Really? It seems to build OK without it here.

-- 
Bye, Peter Korsgaard
