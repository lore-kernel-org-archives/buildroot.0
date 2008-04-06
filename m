From: Samuelsson, Ulf <ulf.samuelsson@atmel.com>
Date: 6 Apr 2008 12:07:16 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am not happy with menuconfig
so either this or revert your
patch.
Your choice...

Best Regards
Ulf Samuelsson

-----Originalmeddelande-----
Fr?n: Peter Korsgaard
Skickat: s?n 2008-04-06 13:43
Till: buildroot at uclibc.org
?rende: Re: [Buildroot] svn commit: trunk/buildroot/target/linux

>>>>> "ulf" = ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-04-06 03:10:30 -0700 (Sun, 06 Apr 2008)
 ulf> New Revision: 21651

 ulf> Log:
 ulf> Make xconfig the default for Atmel targets

 ulf> Modified:
 ulf>    trunk/buildroot/target/linux/Config.in.advanced


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
 ulf> ================================= ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:02:53 UTC (rev 21650)
 ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:10:30 UTC (rev 21651)
 ulf> @@ -445,6 +445,7 @@
 
 ulf>  choice
 ulf>  	prompt "Preferred config tool"
 ulf> +	default BR2_MAKE_XCONFIG IF BR2_TARGET_ATMEL
 ulf>  	default BR2_MAKE_MENUCONFIG

Why? Could we please stop having all this special casing of Atmel
stuff all over buildroot?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
A non-text attachment was scrubbed...
Name: UlfSamuelsson.vcf
Type: application/octet-stream
Size: 491 bytes
Desc: UlfSamuelsson.vcf
Url : http://busybox.net/lists/buildroot/attachments/20080406/90c9d299/attachment-0001.obj 
