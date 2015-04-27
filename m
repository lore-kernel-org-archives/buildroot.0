From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:10:28 +0200
Subject: [Buildroot] [PATCH] cc-tool: new package
In-Reply-To: <553E9212.4090805@bis.org.pl>
References: <1430142129-32750-1-git-send-email-marcin@bis.org.pl>
 <20150427173126.23797992@free-electrons.com>
 <553E9212.4090805@bis.org.pl>
Message-ID: <20150427231028.5a0fd7df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Mon, 27 Apr 2015 21:46:26 +0200, Marcin Bis wrote:

> cc-tool is used for interacting with Texas Instrument's Debugger and 
> Programmer for RF System-on-Chips.
> http://www.ti.com/tool/cc-debugger
> 
> The device is used for programming (and debugging) firmware on various 
> TI Low Power RF System-on-Chips (based on 8051 microcontrolers).
> 
> I am using it for re-flashing such chips from ARM-based embedded devices 
> (running Buildroot generated os) - so I put it under "tools for target" 
> category.

Ok.

> TI chips do not have sufficient resources to run Linux on them, so 
> adding cc-tool as a host tools in Buildroot does not make sense (in my 
> opinion) - the tool has no use on Buildroot generated images.

This is not what a host tools is. A host tool runs on your PC, i.e
where you do the Buildroot build. For sure your PC has sufficient
resources to run cc-tool.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
