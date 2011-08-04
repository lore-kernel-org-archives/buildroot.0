From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Thu, 04 Aug 2011 08:30:21 +0200
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
 Buildroot environment
Message-ID: <4E3A3C7D.8030801@rt-rk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On request from Michael S. Zick question resend without attachment

Hi all,

I would like to add additional package to Buildroot that will build 
Linux kernel driver.
For that I need:
- dependency: build of this package mustn't be started before kernel 
source is available
- kernel source directory: currently, the best I know is: 
$(BASE_DIR)/build/linux-$(BR2_LINUX_KERNEL_VERSION)

I started with package approach but bumped to stated dependency problem. 
Next what I tried is to edit linux/linux.mk to include my driver source 
download, extract. build and install but not so familiar with Buildroot 
scripting...


Did somebody already done something similar? What is best approach? 
Examples are welcomed...

Regards,

Aleksandar Zivkovic
