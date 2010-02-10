From: brian hawley <sproon@hotmail.com>
Date: Wed, 10 Feb 2010 16:45:40 -0600
Subject: [Buildroot] e ink am300 buildroot support
Message-ID: <COL124-W19EB5771BDF131E98D3967D04F0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I am new to buildroot and am a student working on a capstone project with the eink am 300 developement board. I know that buildroot supports the am300 board as it is located in the following folder after a successful build:

./output/build/linux-2.6.32.7/arch/arm/mach-pxa/

which includes the support c file for the gumstix processor and the am300 board. How is it possible to add the support for the am300 board to the build? I do not see this as an option when using the command make menuconfig 

I believe that all I need to do is have the support files generate the drivers need for the board, but again I am unsure and am stuck with just assumptions. 

Background information:
using the gumstix pxa255 arm xscale basix
gumstix is connected to the e ink am300 development board with an active matrix electrophoretic display

Thank you for any help.
Brian
 		 	   		  
_________________________________________________________________
Your E-mail and More On-the-Go. Get Windows Live Hotmail Free.
http://clk.atdmt.com/GBL/go/201469229/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100210/40adbaf8/attachment.htm>
