From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 20 Nov 2012 08:17:54 +0000 (UTC)
Subject: [Buildroot] How to regenerate zImage?
Message-ID: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After I made any small changes in kernel source, I can force the kernel
to be rebuilt by removing the .stamp_built under the
output/build/linux-version directory.  But, it's strange that the
output/zImage file always not get recreated or rebuilt.

How should I force the buildroot to regenerate the zImage file for me?
Thanks.

-- 
woody
I can't go back to yesterday - because I was a different person then.
