From: Frank Kujawski <buildroot@fp8.com>
Date: Wed, 18 Jul 2007 20:41:50 -0500 (CDT)
Subject: [Buildroot] linux26 compile error
In-Reply-To: <469E8600.5000802@teamboyce.co.uk>
References: <52010.75.129.164.68.1184752475.squirrel@kujawski.org>
	<20070718114550.GA22077@marvin.netwinder.org>
	<55400.75.129.164.68.1184768952.squirrel@kujawski.org>
	<469E6DD6.2010106@teamboyce.co.uk>
	<42345.75.129.164.68.1184788955.squirrel@kujawski.org>
	<469E8600.5000802@teamboyce.co.uk>
Message-ID: <47538.75.129.164.68.1184809310.squirrel@kujawski.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rod,
  Thank you.
  I did not define BR2_BOARD_PATH, I defined it and made the directory.
  Now I am consuming cpu cycles.
  Thanks for just enough help,
    Frank

LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/

[snip]
>>
>>
>>
> Frank,
>
>  From your output log message it seems that the system is looking in th
> ewrong place for the kernel-patches directory.  In your case i slooks
> like it is looking off the root directory for this which looks very odd
> to me.
>   I cannot tell if this error message is occuring when makeing th
> ekernel headers target or the actual kernel sorry have a look in
> tool_chain/kernel-headers (or something like that) and have a read of
> target/linux as well both these places could be causing you the
> trouble.  I remember a long time ago I had to create this directory for
> myself and my x86 target but you are using the ARM target and I have
> never had trouble building that.
>
> Sorry I cannot be more help.
> Regards,
> Rod Boyce
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
