From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 5 Aug 2013 18:32:31 +0200
Subject: [Buildroot] boost autobuild failures
Message-ID: <CAAXf6LU4xLuafp4jjhP42kTQ-Yqg+L6L0n2+1bcpMc6pxXuKug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried reproducing the following autobuild failure:
x86_64 |                   boost-1.53.0 | NOK |
http://autobuild.buildroot.net/results/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/

Because the toolchain used in that config is 64-bit, I selected a
Sourcery toolchain for the same architecture (I'm running a 32-bit
machine).

However, boost built just fine on my machine. My .config file attached.

Unfortunately, the last lines of the build log on the autobuild do not
show the actual problem (at least I didn't spot it).

Are there others with a 64-bit machine that can reproduce the problem?
Any idea about the solution?

Thanks,
Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 44526 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130805/9e8856b0/attachment-0001.obj>
