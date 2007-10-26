From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 26 Oct 2007 23:20:20 +0300
Subject: [Buildroot] Cant compile Mplayer package.
In-Reply-To: <4721978B.7020501@googlemail.com>
References: <13409170.post@talk.nabble.com> <4721978B.7020501@googlemail.com>
Message-ID: <47224C04.4000007@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon Pasch wrote:
> Try to remove the atmel-patch in the package/mplayer directory.
> 
> As I posted some time ago...This Patch should depend on the chosen 
> architecture.
> 
> shade wrote:
>> Hi, Im not able to compile mplayer package in current svn version of
>> buildroot. Target architecture is 386. Build fails with: "cabac.h:513:
>> error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'".
>> Please, can You provide any suggestions how to fix this problem? Thx.
>>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Seems it's x86 specific.

I have successfully built mplayer for ARM.
mplayer-1.0rc1-atmel.3.patch - is AVR32 specific patch and it does not affect compilation for ARM.


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
