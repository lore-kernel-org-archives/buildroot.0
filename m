From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 10:45:53 +0100
Subject: [Buildroot] [PATCH] Downloadsite DHCP changed
In-Reply-To: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
 (Markus Kaindl's message of "Thu, 15 Mar 2012 04:55:06 +0100")
References: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
Message-ID: <87obryrycu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Kaindl <markus.kaindl@stusta.mhn.de> writes:

 Markus> ---
 Markus>  package/dhcp/dhcp.mk |    2 +-
 Markus>  1 files changed, 1 insertions(+), 1 deletions(-)

 Markus> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
 Markus> index 10bdc2e..9ec27d3 100644
 Markus> --- a/package/dhcp/dhcp.mk
 Markus> +++ b/package/dhcp/dhcp.mk
 Markus> @@ -5,7 +5,7 @@
 Markus>  #############################################################
 
 Markus>  DHCP_VERSION  = 4.1-ESV-R4
 Markus> -DHCP_SITE     = http://ftp.isc.org/isc/dhcp
 Markus> +DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)

Sorry, I just fixed it myself this morning before I saw your mail.

-- 
Bye, Peter Korsgaard
