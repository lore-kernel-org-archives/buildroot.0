From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 21:43:31 +0200
Subject: [Buildroot] [PATCH v3 1/4] board/minnowboard: Rework to
	generate SD card image
In-Reply-To: <1460820203-6080-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sat, 16 Apr 2016 12:23:20 -0300")
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460820203-6080-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87bn58dnrw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Let's rework the board and config files to use genimage
 > to generate the SD card image directly.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > --
 > Changes from v1:

 >   * host-mtools is needed too, as noted by Peter.

I see you are changing it to use ext4 instead of ext3, but I don't think
there's any real reason we were using ext3 in the first place - So
committed, thanks.


-- 
Bye, Peter Korsgaard
