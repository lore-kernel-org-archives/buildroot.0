From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Thu, 26 Jan 2012 19:19:51 +0100
Subject: [Buildroot] porting libffi to microblaze architecture
Message-ID: <1A377131-99F1-49A3-942A-98679A105DBA@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey fellow buildroot contributors,

(Sorry for posting a similar request again - i could not find the original thread)

I am trying to run python on a microblaze-based SoC. The Systems configuration and creation is currently done using buildroot for cross-compiling and package selection (which works like a charm). 
The problem still remains that libffi (one of pythons dependencies) has not been ported to the Microblaze architecture. We have an existing software framework written in python, which should run on that processor - so python is mandatory for me. 

Can anybody point me to the right spots inside the libffi configuration or code to adjust some parameters in order to compile that library for the microblaze processor? What is the exact difficulty when porting this library to a different machine?

One possible problem i would see is that the Microblaze CPU is some kind of a moving target, since it can be configured in many ways (MMU/NOMMU, HARDFPU/SOFTFPU/NOFPU etc.) so one could then only target one specific configuration.

So i am thankful for any help, recipes for porting software or any advice, you can give me.

thanks, Johannes
--
Johannes Teiwes - jteiwes at tzi.de



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120126/ad096fec/attachment.html>
