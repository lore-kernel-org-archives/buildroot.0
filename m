From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Mon, 22 Oct 2007 11:01:08 -0100
Subject: [Buildroot] Can not build toolchain for arm.
In-Reply-To: <471C7307.1020204@sfktech.com>
References: <20071021120218.1C89BA4A39@busybox.net>
	<471C7307.1020204@sfktech.com>
Message-ID: <471C9104.5000005@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kim Str?ger wrote:
> Hi
> 
> I am trying to build just the toolchain for the arm processor,  using
> buildroot:  At revision 20315
> but I am stock with this error ??
> 
> 
> 
> /home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
> error: '__mf_biglock' undeclared (first use in this function)
> make[5]: *** [pth/mf-runtime.lo] Error 1
> make[5]: Leaving directory
> `/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
> 
> 

Please provide your .config
I have built 4.2.1 armv4 920t  with soft-float and without soft-float successfully.

Best regards,
Ivan
-- 
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
