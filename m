From: Mukesh Kohli <mukesh.kohli@conexant.com>
Date: Wed, 2 Aug 2006 16:33:03 +0530
Subject: [Buildroot] tool chain for ARM1176jf_s
Message-ID: <C580B5F132CA124193B2F531FF789F854A8F03@noida-mail.bbnet.ad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to build tool chain for ARM1176JF_S core. But I am only seeing
option for ARM1136JF_S flavor. 

 

Will manually setting it in .config will work?

 

Here is what I am trying to say:

 

....

# BR2_arm926t is not set

BR2_arm1176jf_s=y

# BR2_sa110 is not set

# BR2_sa1100 is not set

# BR2_xscale is not set

BR2_ARM_TYPE="ARM1176JF_S"

BR2_ARM_OABI=y

# BR2_ARM_EABI is not set

BR2_ARCH="arm"

BR2_ENDIAN="LITTLE"

....

 

Thanks and Regards,

Mukesh Kohli

 

 





********************** Legal Disclaimer ****************************
"This email may contain confidential and privileged material for the sole use of the intended recipient.  Any unauthorized review, use or distribution by others is strictly prohibited.  If you have received the message in error, please advise the sender by reply email and delete the message. Thank you."
**********************************************************************

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060802/2ee8a33e/attachment.htm 
