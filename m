From: Alexandre Schnegg <alexandre.schnegg@gmail.com>
Date: Wed, 27 Nov 2013 17:24:12 +0100
Subject: [Buildroot] Freescale specific kernel header to compile imx-lib
Message-ID: <000b01ceeb8d$1d460fd0$57d22f70$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I use an APF27 board from Armadeus, running an i.MX27. The latest BSP
provides by Armadeus uses Buildroot 2013.05-00008-gc3f1103. In the package
selection I choose imx-lib, which requires some specific header, as said in
the help of the package:


 BR2_PACKAGE_IMX_LIB:


? 


  ?


? 


  ? Library of userspace helpers specific for the Freescale i.MX


? 


  ? platform. It wraps the kernel interfaces for some i.MX platform


? 


  ? specific drivers. It requires a kernel that includes the i.MX


? 


  ? specific headers to be built.


? 


  ?


? 


  ? This library is provided by Freescale as-is and doesn't have


? 


  ? an upstream.


? 


  ?


? 


  ? Symbol: BR2_PACKAGE_IMX_LIB [=y]


? 


  ? Type  : boolean


? 


  ? Prompt: imx-lib


? 


  ?   Defined at package/imx-lib/Config.in:4


? 


  ?   Depends on: BR2_LINUX_KERNEL [=y] && BR2_arm [=y]


? 


  ?   Location:


? 


  ?

-> Package Selection for the target


? 


  ?  

-> Libraries


? 


  ?    

-> Hardware handling


? 


  ?   Selected by: BR2_PACKAGE_GST_FSL_PLUGINS [=n] && BR2_LINUX_KERNEL [=y]
&& BR2_arm [=y] && \               

? 

	

  ? BR2_PACKAGE_GSTREAMER [=n] || BR2_PACKAGE_IMX_TEST [=n] ||
BR2_PACKAGE_LIBFSLVPUWRAP [=y] && \              

? 

	

  ? BR2_LINUX_KERNEL [=y] && BR2_arm [=y]

 My question is : can I get this header on my cross-compile machine running
Ubuntu 13.04 or am I forced to use a Freescale BSP and do a native
compilation ?

 Thanks in advance

 Regards

Alexandre Schnegg

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131127/c58d784d/attachment.html>
