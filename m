From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 09:07:06 +0200
Subject: [Buildroot] [PATCH 1/1] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.0
In-Reply-To: <1556659700-17918-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Tue, 30 Apr 2019 23:28:20 +0200")
References: <1556659700-17918-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87tveek605.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > This commit :
 > 	- bumps Linux & U-Boot to linux4sam_6.0.
 > 	- bumps at91bootstrap to v3.8.12.
 > 	- removes old in-tree dts (now in dt-overlay-at91 [1][2])
 > 	- adapts genimage accordingly.

 > [1] https://github.com/linux4sam/dt-overlay-at91/tree/master/sama5d27_som1_ek
 > [2] http://www.at91.com/linux4sam/bin/view/Linux4SAM/DT-Overlay

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed, thanks.

-- 
Bye, Peter Korsgaard
