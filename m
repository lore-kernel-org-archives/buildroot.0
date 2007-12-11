From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 11 Dec 2007 23:39:42 +0100
Subject: [Buildroot] Kernel Name
References: <d6cda7730712111015h55cd8d7fjc011b1f295757b02@mail.gmail.com>
Message-ID: <007c01c83c46$bcde9460$ee031b0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
To: "buildroot" <buildroot@uclibc.org>
Sent: Tuesday, December 11, 2007 7:15 PM
Subject: [Buildroot] Kernel Name


> Hi,
> 
>   Don't know in which revision, but the naming of the Kernel binary
> has changed. It is now being copied to /boot under the name
> atngw100-linux-2.6.22.10-20071211 which is just awful.
> 
>   Is there a way to keep it as /uImage as previously?
> 


I think you get the simple name by not choosing the the advanced linux installation.
The "advanced linux" installation will give the image a name, indicating its contents.

In the AT91 U-boot, there is support for autoscripts which will setup the u-boot environment in a way
that you do not have to type the complete name.
You can probably quite easily create similar autoscripts.


Best Regards
Ulf Samuelsson
