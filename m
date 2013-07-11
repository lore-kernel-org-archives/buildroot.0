From: Sinan Akpolat <sinan@linkas.com.tr>
Date: Thu, 11 Jul 2013 18:06:32 +0300
Subject: [Buildroot] About using ti-gfx package with cutom kernel
Message-ID: <51DEC9F8.7010800@linkas.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to thank Spenser for his great work on TI's PowerVR driver package.

I couldn't test it yet and I need to ask something about that.

The package needs Linux kernel to be selected. However I'm using a 
custom kernel provided by the board manufacturer. How can I make 
buildroot use that kernel? Or what is the correct way?

Should I copy my custom kernel directory to output/build and change 
version to suffix of the directory name

Or should I edit the makefiles and make buildroot (TI_GFX package more 
specifically) use my custom kernel's path while compiling PowerVR drivers?

I guess this was discussed last month but I couldn't see how that 
discussion ended.

Thanks again for the package,
Sinan Akpolat
