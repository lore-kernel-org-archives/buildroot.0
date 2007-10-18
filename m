From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Oct 2007 22:20:15 +0200
Subject: [Buildroot] svn At revision 20289 breakage
References: <4717A47F.4000908@asist.si> <4717C93A.3080401@promwad.com>
Message-ID: <0c3501c811c4$63522850$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> rm -rf
>> /home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/buildroot-config
>> mkdir -p
>> /home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32
>> cp -dpRf package/config/buildroot-config
>> /home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/buildroot-config
>> cp -dpf
>> /home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.config
>> cp: missing destination file operand after
>> `/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.config'
>> Try `cp --help' for more information.
>> make: ***
>> [/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.configured]
>> Error 1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>
> Yes, I have the same error:
>
> rm -rf /opt/buildroot/project_build_arm/uclibc/buildroot-config
> mkdir -p /opt/buildroot/project_build_arm/uclibc
> cp -dpRf package/config/buildroot-config 
> /opt/buildroot/project_build_arm/uclibc/buildroot-config
> cp -dpf  /opt/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config
> cp: missing destination file operand after 
> `/opt/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
> Try `cp --help' for more information.
> make: *** 
> [/opt/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.configured] 
> Error 1
>
>

Key question:

What does

$ cp a

do?

Best Regards
Ulf Samuelsson 
