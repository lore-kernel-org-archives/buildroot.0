From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 May 2016 13:24:30 -0300
Subject: [Buildroot] gstreamer-1.0 and egl
In-Reply-To: <fed59547-54cb-ff07-5d54-8e9e0b263ca5@gmail.com>
References: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
 <57487050.4040309@zacarias.com.ar>
 <b35e550d-8cf4-5912-e700-b050ab498e0c@gmail.com>
 <57487323.8090101@zacarias.com.ar>
 <fed59547-54cb-ff07-5d54-8e9e0b263ca5@gmail.com>
Message-ID: <574874BE.7050300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/05/16 13:21, Marco Trapanese wrote:

> Thanks for the clarifications.
> Tonight I'm going to rebuild the whole environment using mesa3d - I hope
> it will work!
>
> Best regards

Keep in mind that in order to use the open vc4 driver you need a special 
(different) kernel config with the dts patches at the least, plus some 
config.txt tweaks.
There are some notes here, but they don't seem to be up to date:
https://dri.freedesktop.org/wiki/VC4/
Regards.
