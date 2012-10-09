From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Oct 2012 14:44:58 +0200
Subject: [Buildroot] [PATCH 1/4] mpd: bump to version 0.17.2
In-Reply-To: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 8 Oct 2012 19:01:02 -0300")
References: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d30rbyr9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/mpd/mpd.mk |    2 +-
 Gustavo>  1 files changed, 1 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
 Gustavo> index 8a5ceb6..ab3a357 100644
 Gustavo> --- a/package/multimedia/mpd/mpd.mk
 Gustavo> +++ b/package/multimedia/mpd/mpd.mk
 Gustavo> @@ -4,7 +4,7 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -MPD_VERSION = 0.17.1
 Gustavo> +MPD_VERSION = 0.17.2
 Gustavo>  MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 Gustavo>  MPD_DEPENDENCIES = host-pkgconf libglib2

This is blocked on the pkg-config / pkgconf series. I'll try to find
time to look at that in detail this week.

-- 
Bye, Peter Korsgaard
