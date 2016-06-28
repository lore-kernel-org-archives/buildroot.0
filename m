From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:00:38 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add support for simple
	background scan
In-Reply-To: <1465661589-10963-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Sat, 11 Jun 2016 17:13:09 +0100")
References: <1465661589-10963-1-git-send-email-martin@barkynet.com>
Message-ID: <87k2h9krrt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > CONFIG_BGSCAN_SIMPLE is missing from the defconfig included with
 > wpa_supplicant.  Many programs that depend on wpa_supplicant assume
 > bgscan is enabled, for example connman will try to set bgscan by default.
 > It is safe to always enable CONFIG_BGSCAN_SIMPLE since it is only used if
 > wpa_supplicant is configured to do so.

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
