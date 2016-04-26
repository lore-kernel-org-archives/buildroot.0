From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Apr 2016 16:38:37 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Tue, 26 Apr 2016 16:27:33 +0200")
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
Message-ID: <878u00o2oi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi Peter,
 > I've tried to compile the repo version:
 > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"

 > with:
 > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

 > For rpi/rpi2 and it doesn't work. The compiling is right but it doesn't
 > work, I can see the message on /dev/ttyAMA0 terminal:

 > Uncompressing Linux... done, booting the kernel.

 > But it's stuck at this point, however in RPi3 works fine.

So you are saying that the current raspberrypi_defconfig /
raspberrypi2_defconfig doesn't boot on your rpi1 / rpi2 boards? That's
odd as I verified raspberrypi_defconfig on my rpi1 (very old B version)
the other day without problems.

Are you sure you did a clean build of everything?

-- 
Venlig hilsen,
Peter Korsgaard 
