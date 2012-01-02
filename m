From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 2 Jan 2012 16:42:01 +0100
Subject: [Buildroot] Generating a 32-bit toolchain on a 64-bit machine
Message-ID: <CAAXf6LXeu+ftimzd=ydJAnwTry6BgZ4QXJ4qhUFnLWyNE3NhfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to create a 32-bit toolchain on a 64-bit machine with
buildroot/crosstool-ng. By default, all host tools will be 64-bit.

I couldn't find a configuration option or the like for this.
I guess one way to do is it to call 'make' like this:
make HOSTCC="`which gcc` -m32" HOSTCXX="`which g++` -m32" HOSTCPP="cpp
-m32" HOSTLD="ld -m32"
but ideally there'd be a configuration for this.

In crosstool-ng I didn't find such an option either...

Thanks for your advice,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120102/ba97f067/attachment-0001.html>
