From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Thu, 11 Dec 2008 09:03:45 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about 800k
	!?
Message-ID: <4940C961.7080602@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm using buildroot revision 23203. After all seems to work on my 
at91sam9263 based board, I figured out that scp transferes not more than 
800kByte in one file. This is not acceptable and I tried openssh instead 
of dropbear. Still, the maximum transferable file size is less than 800k.

Any idea where the limit is bound to?

Regards
	akuehn
