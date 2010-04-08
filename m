From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Apr 2010 10:03:01 +0200
Subject: [Buildroot] [PATCH]Add a fbv-1.0b patch to support bgr555
	framebuffer format.
In-Reply-To: <C83D7CE8356557448A893798C8F9931D050E19B3@frimb01.corp.atmel.com>
	(Josh Wu's message of "Thu, 8 Apr 2010 08:35:45 +0200")
References: <C83D7CE8356557448A893798C8F9931D050E19B3@frimb01.corp.atmel.com>
Message-ID: <87fx36pe16.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Josh" == Wu, Josh <Josh.wu@atmel.com> writes:

 Josh> Hi,

 Josh> Here is a patch for fbv-1.0b to add support to bgr555 frame
 Josh> buffer format(at91sam9263ek using this format).

Committed, thanks.

I fixed two minor issues:
- The patch was marked executable (made on Windows?)
- There was no patch header describing what the patch does and who made
it. See
http://lists.busybox.net/pipermail/buildroot/2010-April/033240.html for
more info about the format we would like to use.

-- 
Bye, Peter Korsgaard
