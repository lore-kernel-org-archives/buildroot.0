From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 13:15:01 +0100
Subject: [Buildroot] [PATCH] linux-firmware: ath9k_htc - use newer
	firmware
In-Reply-To: <1458038864-1872-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Tue, 15 Mar 2016 13:47:44 +0300")
References: <1458038864-1872-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87shzsaqey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Existing blobs are of version ath9k-htc 1.3.1, see
 > http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=21a6c3e55df956dd223279627685778268ede70f

 > These are as said in the commit are left for compatibility with older
 > kernels which [older kernels] will look for blobs in the
 > root of "/lib/firmware".

 > But there're newer v1.4 blobs in ath9k_htc folder.
 > And newer kernels (>=4.4) look first in that new location
 > "/lib/firmware/ath9k_htc".

 > Note that even new kernels will fall back to previous location
 > if new one doesn't exist.

 > Tested with TP-LINK TL-WN722N (has Atheros AR9271 inside).

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
