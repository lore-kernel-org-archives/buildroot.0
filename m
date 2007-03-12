From: Soeren Straarup <xride@x12.dk>
Date: Mon, 12 Mar 2007 15:31:55 +0100
Subject: [Buildroot] Board specific default configurations.
Message-ID: <20070312143154.GO81938@x12.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I wish that there was a way to do default configuration of fx. embedded
boards like the linux kernel does.

make <insert_board_name>_defconfig CONFIG_FILE=path/to/my/custom.config

What I have made the default configuration files are located within
buildroot in configs.
This can be overwritten by added the path via BOARD_CONFIG_DIR=path on the
make line.

http://xride.dk/br/br-Makefile-BOARD_CONFIG_FILE.patch

The intention of this patch is to copy the *_defconfig to .config
then append the custom config file and run conf

/Soeren

-- 
Soeren Straarup   | aka OZ2DAK aka Xride
FreeBSD committer | FreeBSD since 2.2.6-R
  If a program is not working right, then send a patch
