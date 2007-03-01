From: Piotr Adam Zolnierczuk <pzolnier@indiana.edu>
Date: Wed, 28 Feb 2007 19:48:36 -0500
Subject: [Buildroot] static libgcc_s
In-Reply-To: <20070228214534.GA23235@codepoet.org>
References: <45E5A4E6.3010508@indiana.edu>
	<20070228214534.GA23235@codepoet.org>
Message-ID: <45E622E4.6010600@indiana.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Eric
It's a good thought. I will certainly give it a try.

It still, though,  leaves me with two toolchains:
one 'static' for dataflash and u-boot  and a second 'dynamic'  for 
kernel and applications (for space considerations)

I am still curious if one could have just one toolchain that rules them 
all ... :)

Piotr

Erik Andersen wrote:
> On Wed Feb 28, 2007 at 10:51:02AM -0500, Piotr Adam Zolnierczuk wrote:
>   
>> Any ideas how can I "force" buildroot to build a static version of libgcc_s?
>>     
>
> disable BR2_GCC_SHARED_LIBGCC in your buildroot .config
> and rebuild your toolchain.  No more shared libgcc_s...
>
>  -Erik
>
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--
>   


-- 
 __________________________________________________________________
 Piotr Adam Zolnierczuk
 Indiana University                          phone:  (812) 855-3613
 Cyclotron Facility                          fax:    (812) 855-6645
 2401 Milo B Sampson Ln               e-mail:  pzolnier at indiana.edu
 Bloomington,IN 47408, USA   http://www.iucf.indiana.edu/u/pzolnier
 __________________________________________________________________
                   written on recycled electrons                 	


-------------- next part --------------
A non-text attachment was scrubbed...
Name: pzolnier.vcf
Type: text/x-vcard
Size: 317 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20070228/5deb8137/attachment-0002.vcf 
