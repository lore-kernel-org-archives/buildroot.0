From: Samuelsson, Ulf <ulf.samuelsson@atmel.com>
Date: 6 Apr 2008 15:28:50 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <03b701c89801$6b9003e6$85f0af0a@corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



-----Originalmeddelande-----
Fr?n: Peter Korsgaard
Skickat: s?n 2008-04-06 14:34
Till: Samuelsson, Ulf
Kopia: Peter Korsgaard;buildroot at uclibc.org
?rende: Re: SV: Re: [Buildroot] svn commit: trunk/buildroot/target/linux
 
>>>>> "Ulf" = Samuelsson, Ulf <ulf.samuelsson@atmel.com> writes:

 Ulf> I am not happy with menuconfig
 Ulf> so either this or revert your
 Ulf> patch.
 Ulf> Your choice...

Bah, as I said back then xconfig is not a good default. It has
additional dependencies we don't provide/check for and as we already
use menuconfig interface for buildroot that's the only sane default.

The default values should work out of the box!

But as it's just a default, you can always change it locally if you
prefer xconfig.

=> Try "make > project.log 2>&1"
    with menuconfig enabled.
    I doubt that will give the 
     desired result.
     If people have a problem
    then they should keep
    the normal kernel build.
    Menuconfig is soo 20th 
   century.

-- 
Bye, Peter Korsgaard


-------------- next part --------------
A non-text attachment was scrubbed...
Name: UlfSamuelsson.vcf
Type: application/octet-stream
Size: 491 bytes
Desc: UlfSamuelsson.vcf
Url : http://busybox.net/lists/buildroot/attachments/20080406/6920f8db/attachment.obj 
