From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jun 2017 16:44:41 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for generating
 U-Boot boot scripts
In-Reply-To: <87injom7hg.fsf@dell.be.48ers.dk>
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
 <87h8z8i8o5.fsf@dell.be.48ers.dk>
 <20170622133120.735b26c2@windsurf>
 <87injom7hg.fsf@dell.be.48ers.dk>
Message-ID: <20170622164441.26e74287@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 16:18:03 +0200, Peter Korsgaard wrote:

>  > BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="script1src:script1dest script2src:script2dest"  
> 
>  > We could still keep the compatibility by having:  
> 
>  > BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="script1src"  
> 
>  > just generate script1src and install it as boot.scr.  
> 
>  > Or maybe it's something we can take care of later?  
> 
> Or alternatively use destfile = srcfile with extension replaced by .bin

Doesn't really match the default case where the boot script is expected
by U-Boot to be called boot.scr.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
