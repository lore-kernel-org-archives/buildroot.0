From: Samuelsson, Ulf <ulf.samuelsson@atmel.com>
Date: 25 Mar 2008 13:10:14 +0000
Subject: [Buildroot] avr32 breakage
Message-ID: <026a01c88ebf$17ba0f82$85f0af0a@corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggest you work with the 
external source and apply
patches against that.

Best Regards
Ulf Samuelsson

-----Originalmeddelande-----
Fr?n: John Voltz
Skickat: tis 2008-03-25 12:34
Till: Buildroot List
?rende: Re: [Buildroot] avr32 breakage

I used the internal source, without the AVR32 patches. I'm not sure what to
do with the AVR32 stuff yet. gcc 4.2.1 creates unstable executables. I'm
recommending that people use gcc 4.1.2 until something is done about 4.2.1.
I'm generating and testing updated patches for 4.1.2 right now. I'll commit
them if they don't cause problems with other arches and seem to be stable.

John

On Tue, Mar 25, 2008 at 4:45 AM, Ulf Samuelsson <ulf.samuelsson@atmel.com>
wrote:

>
>
> >I can say without a doubt now that the avr32 gcc patches are bad. I
> created
> > a bootable ext3 image for x86 and ran it in qemu, everything works fine.
> > Blackbox works fine in X too. I wasn't able to get Webkit+Midori to run
> > because I didn't have time before I left the shop. I will report back
> with
> > more later.
> >
> > John
> >
>
> Did you build using the external source, or internal source.
>
> Best Regards
> Ulf Samuelsson
>
>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: UlfSamuelsson.vcf
Type: application/octet-stream
Size: 475 bytes
Desc: UlfSamuelsson.vcf
Url : http://busybox.net/lists/buildroot/attachments/20080325/c6e4278d/attachment.obj 
