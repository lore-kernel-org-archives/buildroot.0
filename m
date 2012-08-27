From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 28 Aug 2012 01:15:11 +0300
Subject: [Buildroot] [PATCH] upx: high-performance executable packer with
	in-place decompression support
Message-ID: <1346105712-20614-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the 90s when I was a serious DOS and Windows gamer I used a
tool called UPX to make my game collection smaller so that I
could stuff them to 3.5" diskettes.

That tool still exists and has been updated last time in 2011 
December.

So, if you have used every compiler switch and every tip & trick
in the book and still not satisfied with the size of your system
then give this tool a try.

Just use the upx --lzma executable_name to compress.

In my tests I could cut my system size by almost 50% and 
no functionality loss. :)
