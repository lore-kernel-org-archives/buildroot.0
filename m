From: =?UTF-8?Q?Refik_Tuzakl=C4=B1?= <tuzaklirefik@gmail.com>
Date: Wed, 19 Jul 2017 05:16:01 -0700 (PDT)
Subject: [Buildroot] [RFC] kernel-module-imx-gpu-viv:compaling error
In-Reply-To: <CAOMZO5C23FnwscYL78DZcuaxk36u+ZyD17iBghYwPoR_UYkkZQ@mail.gmail.com>
References: <1500358371269-171162.post@n4.nabble.com>
 <20170718100720.39028066@windsurf>
 <CAAMH-ysnm5JMQnAJ4jQJS700o1tDE6tKeW0-niz8eBdRRQXWSQ@mail.gmail.com>
 <20170718110245.1f85dafb@windsurf.lan>
 <1500375085852-171182.post@n4.nabble.com>
 <CAOMZO5C23FnwscYL78DZcuaxk36u+ZyD17iBghYwPoR_UYkkZQ@mail.gmail.com>
Message-ID: <1500466561292-171268.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I applied your suggestion and create a config file according to
freescale_imx6qsabresd_defconfig.
at my first try, BR2_LINUX_KERNEL_DEFCONFIG [=imx_v7]. there was no error
while compiling however,
after flashing imx6 with MFG tool, u-boot does not boot kernel.

I shifted to BR2_LINUX_KERNEL_DEFCONFIG [=imx_v7_mfg]. It still compiling.
You can find config file below. what can make the error that u-boot can not
boot kernel.

should I compile u-boot, too?

Thomas,

At least, I read your help text :) 

Fabian,

I  support your idea, I promise if you add imx6q-sabresd_qt5_defconfig, I
will be one to try it and I will write a comment about it.

defconfig.defconfig
<http://buildroot-busybox.2317881.n4.nabble.com/file/n171268/defconfig.defconfig>  



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/RFC-kernel-module-imx-gpu-viv-compaling-error-tp171162p171268.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
