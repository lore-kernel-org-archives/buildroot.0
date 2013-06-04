From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Jun 2013 08:48:38 +0200
Subject: [Buildroot] [PATCH 3/7] orc: add license info
In-Reply-To: <1370311415-1966-3-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 3 Jun 2013 22:03:31 -0400")
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
 <1370311415-1966-3-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87sj0yfk1l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Danomi> ---
 Danomi>  package/orc/orc.mk |    2 ++
 Danomi>  1 file changed, 2 insertions(+)

 Danomi> diff --git a/package/orc/orc.mk b/package/orc/orc.mk
 Danomi> index 77cb29f..84d004e 100644
 Danomi> --- a/package/orc/orc.mk
 Danomi> +++ b/package/orc/orc.mk
 Danomi> @@ -5,6 +5,8 @@
 Danomi>  #############################################################
 Danomi>  ORC_VERSION = 0.4.16
 Danomi>  ORC_SITE = http://code.entropywave.com/download/orc/
 Danomi> +ORC_LICENSE = BSD
 Danomi> +ORC_LICENSE_FILES = COPYING

According to that file, it is actually a mix of BSD-2c and
BSD-3c. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
