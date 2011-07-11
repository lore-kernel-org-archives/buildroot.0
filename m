From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:27:35 +0200
Subject: [Buildroot] [PATCH] alsa-utils: Add patch for amixer TLV output
In-Reply-To: <1310399020-27026-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 11 Jul 2011 17:43:40 +0200")
References: <1310399020-27026-1-git-send-email-zonque@gmail.com>
Message-ID: <874o2smxco.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> This patch is queued upstream, so it can be dropped once a new version
 Daniel> of alsa-utils is released.

Could you give a quick explanation about what the patch does for people
not following alsa development?

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Daniel> ---
 Daniel>  .../alsa-utils/alsa-utils-amixer-tlv-fix.patch     |   32 ++++++++++++++++++++
 Daniel>  1 files changed, 32 insertions(+), 0 deletions(-)
 Daniel>  create mode 100644 package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch

 Daniel> diff --git a/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch b/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch
 Daniel> new file mode 100644
 Daniel> index 0000000..1b5e9c5
 Daniel> --- /dev/null
 Daniel> +++ b/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch
 Daniel> @@ -0,0 +1,32 @@

Please add a full git-style patch header with your signed-off-by (which
should be easy to do if it's upstream).

-- 
Bye, Peter Korsgaard
