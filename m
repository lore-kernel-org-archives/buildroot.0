From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 14:50:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-10-11
In-Reply-To: <CAOMZO5DO4yqN82QVpui-17S=trtW=tbBk7h5fJPBXO__fTe0Sw@mail.gmail.com>
References: <5da16fea.1c69fb81.4eda5.4f71SMTPIN_ADDED_MISSING@mx.google.com>
 <CAOMZO5DO4yqN82QVpui-17S=trtW=tbBk7h5fJPBXO__fTe0Sw@mail.gmail.com>
Message-ID: <20191012145031.42d7cd69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Sat, 12 Oct 2019 09:41:10 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> >                         defconfig |                        link to the job
> > ----------------------------------+--------------------------------------------------------------
> >                    imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190  
> 
> /bin/sh: 1: lzop: not found
> 
> So you need to install lzop package in the host PC.

No, you need to enable BR2_TARGET_UBOOT_NEEDS_LZOP in your defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
