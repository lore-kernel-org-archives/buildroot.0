From: Mark Fisher <fobs12@ymail.com>
Date: Tue, 14 Apr 2009 06:55:14 -0700 (PDT)
Subject: [Buildroot] /dev files not being created correctly
Message-ID: <204928.46075.qm@web43412.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm relatively new to buildroot and am using the 2009.02 release of buildroot on a Fedora 9 platform and targeting an embedded device with an Intel Atom processor. 

When the root filesystem is built the types of the files are all set to plain text files. So for instance the /dev/console is not set to be a character device. This has already create problems when I try to boot because the console could not be opened. I manually fixed /dev/console and /dev/null. I'm still having trouble booting the image and also after a?re-build my custom changes were lost.

Is this a known problem, and is there a fix? If not should I delete all the files in the /dev directory and then re-create them based on the settings in the device_table.txt?

Thanks,

Mark



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090414/3d8edb79/attachment.htm>
