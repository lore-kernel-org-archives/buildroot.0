From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:05:18 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to version
	7.0.3-3
In-Reply-To: <1476114462-5851-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 10 Oct 2016 12:47:42 -0300")
References: <1476114462-5851-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pon4lr6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > memory allocate failure in AcquireQuantumPixels (quantum.c)
 > heap-based buffer overflow in IsPixelMonochrome (pixel-accessor.h)

 > No CVEs assigned yet.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
