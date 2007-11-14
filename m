From: jake sullivan <jacob_sullivan@yahoo.com>
Date: Wed, 14 Nov 2007 09:34:01 -0800 (PST)
Subject: [Buildroot] newbie questions (filesystems and bootimage)
Message-ID: <899048.6025.qm@web56403.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a motion control application that I would like to port from a desktop environment to an "embedded" environment.  I have played with the buildroot software and read through the documentation/mailing lists but still have a couple of questions...

The target device is an i486 device with 128megs of RAM and a 128meg flash drive.  Once loaded into memory, the application rarely (once or twice a month) will write a configuration change to the drive.

1) What is the current wisdom on filesystems/types?  It there a reason to not stick with ext2 which seems to be pretty common?

2) How exactly do I get the target image to the device?  I have an adapter to mount the flash drive into my desktop.  I have tried dd'ing it to the drive and tried something in the mailing archives that used rsync, but when I mounted the drive into the device, it couldn't find the OS.  I know all the hardware is working because I have an old slackware image I can dd to the drive and it boots fine.

Jake

Is there a place to post HowTo's/FAQs for this project?  Once I get this working, I might as well post it for the next newbie...





      ____________________________________________________________________________________
Be a better sports nut!  Let your teams follow you 
with Yahoo Mobile. Try it now.  http://mobile.yahoo.com/sports;_ylt=At9_qDKvtAbMuh1G1SQtBI7ntAcJ
