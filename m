From: Jan Pohanka <xhpohanka@gmail.com>
Date: Mon, 24 Jun 2013 12:55:52 +0200
Subject: [Buildroot] why to have separate uboot-tools?
Message-ID: <51C825B8.6070800@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

currently I'm trying to customize buildroot a bit to allow it to be used 
by my colleagues as a base of their development environment.
I have noticed that there is separate package for u-boot-tools (mkimage, 
etc.) Can please someone tell me why these tools are not installed from 
u-boot package defined in bootloaders section?

Once we use our own u-boot with its own tools (uflash from TI) I need to 
alter two packages and also u-boot sources are downloaded two times.
I can prepare a patch to use just u-boot in bootloaders section, but the 
question is if it is not worthless...

thanks
Jan
