From: Matt Wood <mattwood2000@gmx.net>
Date: Fri, 19 Dec 2008 17:59:59 +0100
Subject: [Buildroot] u-boot and at91bootstrap NAND flash options
Message-ID: <20081219165959.207450@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys, is there any specific reason why buildroot does not have options in the menuconfig to compile u-boot with NAND flash support for the AT91SAM9xxx devices?  I know that NAND support does not function for the RevA SAM9260, SAM9263, and the SAM9261, but Rev B has been out for a while for the first two and I think it would be nice to see the options in buildroot instead of having to build manually or download the pre-built binaries from www.linux4sam.org.  

Also, the NAND flash option for at91bootstrap does not work.  The NAND code is missing.  I know that at91bootstrap-1.9 (found here:  ftp://www.linux4sam.org/pub/at91bootstrap/) has fully functional NAND support - any reason why this has not been integrated into the buildroot at91bootstrap?

Thanks, Matt.
-- 
Sensationsangebot verl?ngert: GMX FreeDSL - Telefonanschluss + DSL 
f?r nur 16,37 Euro/mtl.!* http://dsl.gmx.de/?ac=OM.AD.PD003K1308T4569a
