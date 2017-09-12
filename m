From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:28:07 +0200
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2017.09
In-Reply-To: <CAOMZO5Cy39dYHhhRA05UgG_T=P98w57RcESzonyTJvpwVH=yeA@mail.gmail.com>
 (Fabio Estevam's message of "Tue, 12 Sep 2017 17:45:21 -0300")
References: <1505157066-25651-1-git-send-email-festevam@gmail.com>
 <1505157066-25651-2-git-send-email-festevam@gmail.com>
 <87vakn656b.fsf@dell.be.48ers.dk>
 <CAOMZO5Cy39dYHhhRA05UgG_T=P98w57RcESzonyTJvpwVH=yeA@mail.gmail.com>
Message-ID: <87mv5z61zs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

Hi,

 >> > -UBOOT_TOOLS_VERSION = 2017.07
 >> > +UBOOT_TOOLS_VERSION = 2017.09
 >> 
 >> This doesn't seem to work here:

 > Seems to build fine here with a mx53loco_defconfig target:
 > https://pastebin.com/8tPC6MWN

That seems to only build host-uboot-tools. The error I pasted was from
uboot-tools (E.G. build for the target).

-- 
Bye, Peter Korsgaard
