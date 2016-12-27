From: Ashish_Kumar_Mishra <dgashu55@gmail.com>
Date: Tue, 27 Dec 2016 01:03:11 -0800 (PST)
Subject: [Buildroot] BB-Black setup fails to boot using Buildroot Training
 Lab Book [December 26, 2016]
Message-ID: <1482829391152-153506.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All ,

This in my first post here & i am not sure weather such support / problem
queries are allowed here or not. 
Would request to please let me know the correct forum so that i can continue
there. 

This is my first attempt to learn the Buildroot (and BB Black) . 

I am following the procedure mentioned in Buildroot Training Lab Book from
free electrons dated December 26, 2016. 
After following all the steps i created an SD card setup but the board
booting fails with below mentioned log:-

U-Boot SPL 2016.03 (Dec 27 2016 - 12:45:34)
Trying to boot from MMC
Card doesn't support part_switch
MMC partition switch failed
*** Warning - MMC partition switch failed, using default environment

reading u-boot.img
reading u-boot.img


U-Boot 2016.03 (Dec 27 2016 - 12:45:34 +0530)

       Watchdog enabled
I2C:   ready
DRAM:  512 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
Net:   Could not get PHY for cpsw: addr 0
cpsw, usb_ether
Press SPACE to abort autoboot in 1 seconds
reading uImage-dtb.am335x-boneblack
** Unable to read file uImage-dtb.am335x-boneblack **
Wrong Image Format for bootm command
ERROR: can't get kernel image!
=> 


Could group members please provide few pointers to get the proper board
booting  .

Thanks 
Ashish Kumar Mishra.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/BB-Black-setup-fails-to-boot-using-Buildroot-Training-Lab-Book-December-26-2016-tp153506.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
