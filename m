From: Frank Kujawski <buildroot@fp8.com>
Date: Tue, 24 Jul 2007 14:31:35 -0500 (CDT)
Subject: [Buildroot] buildroot/toolchain_build_armeb
In-Reply-To: <44028.75.129.164.68.1185280112.squirrel@kujawski.org>
References: <37183.75.129.164.68.1185273361.squirrel@kujawski.org>
	<44028.75.129.164.68.1185280112.squirrel@kujawski.org>
Message-ID: <6240.75.129.164.68.1185305495.squirrel@kujawski.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
>>   Somewhere recently, buildroot/toolchain_build_armeb is nolonger being
>> created.  I get a make error at:
>> bzcat /projects/BuildRoot/buildroot/../dl/module-init-tools-3.2.2.tar.bz2 |
>> tar -C /projects/BuildRoot/buildroot/toolchain_build_armeb -xvf -
>> tar: /projects/BuildRoot/buildroot/toolchain_build_armeb: Cannot chdir: No
>> such file or directory
>>
>> But, build_armeb/ project_build_armeb/ do get created correctly.
>
> in continuing to compile, I error out at:
> /projects/BuildRoot/buildroot/toolchain_build_armeb/bin/sed -i -e
> '/CONFIG_AEABI/d'
> /projects/BuildRoot/buildroot/build_armeb/linux-2.6.21.5/.config
> make: /projects/BuildRoot/buildroot/toolchain_build_armeb/bin/sed: Command not
> found
> make: ***
> [/projects/BuildRoot/buildroot/build_armeb/linux-2.6.21.5/.configured] Error
> 127
>
> Perhaps there is something here that would help..
>
>   Frank
Just for fun,
I ran it using i386, toolchain_build_i386 was auto created

>
>
>>
>>   Frank
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
