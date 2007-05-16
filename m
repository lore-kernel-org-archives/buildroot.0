From: Diego A. Fons <diegofons@apexar.com>
Date: Wed, 16 May 2007 13:45:27 -0300
Subject: [Buildroot] Problem with FB
Message-ID: <464B3527.4080406@apexar.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

First of all i'm not sure if it is the correct list for posting this 
mail, if it's not, please tell me wich list is the correct one.

I'm working on an embedded device (a Ronetix pm9261 board with an 
AT91SAM9261 cpu), i could build the linux kernel version 2.6.19.7 with 
framebuffer support and it works fine. The problem is when i run any 
command that uses net services, i.e. when i run sftp the sreen moves and 
it kept like this, the offset (0,0) is in position (100,0) (it's just an 
example, i don't know thw correct values) and i'm not able to correct 
it. It occurs every time i run a net comand. The display i'm usin is a 
LCD and the driver is sidsab.c.

Thank you for your time and i'll be waiting any suggestions.

Regards,
Diego A. Fons.
