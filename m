From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 26 Nov 2009 00:28:54 +0100
Subject: [Buildroot] failure to bump libxml2 to version 2.7.6 :
 libtool-patch error
In-Reply-To: <B8B073A8C8E044988ED5D528DA4EFE70@apexjs>
References: <B8B073A8C8E044988ED5D528DA4EFE70@apexjs>
Message-ID: <1259191734.4236.2018.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Which version of buildroot ?

Le jeudi 26 novembre 2009 ? 00:19 +0100, Sagaert Johan a ?crit :
> Hi 
>  
> In order to use the latest libxml 2.7.6 with a lot  bugs fixed
> I get this error when building : (just changed the version in the
> libxml2.mk)
>  
> I don't see why a libtool-patch is been applied since there are no
> patch files in the package directory.
>  
>  
> #make 
>  
> Checking build system dependencies:
> Overriding $(DL_DIR) in '.config'.  Ok
> External download directory:   Ok (/home/johan/dl)
> CC clean:     Ok
> CXX clean:     Ok
> CPP clean:     Ok
> CFLAGS clean:     Ok
> INCLUDES clean:     Ok
> CXXFLAGS clean:     Ok
> which installed:    Ok
> sed works:     Ok (/bin/sed)
> GNU make version '3.81':   Ok
> C compiler '/usr/bin/gcc'
> C compiler version '4.3.2':   Ok
> C++ compiler '/usr/bin/g++'
> C++ compiler version '4.3.2':   Ok
> awk installed:     Ok
> bash installed:     Ok
> bison installed:    Ok
> flex installed:     Ok
> gettext installed:    Ok
> makeinfo installed:    Ok
> patch installed:    Ok
> Build system dependencies:   Ok
>  
> rm -rf /home/johan/buildroot/output/build/buildroot-config
> mkdir -p /home/johan/buildroot/output/build
> cp -dpRf
> package/config/buildroot-config /home/johan/buildroot/output/build/buildroot-config
> cp
> -dpf /home/johan/buildroot/output/build/u-boot-2009.11/tools/mkimage /home/johan/buildroot/output/build/staging_dir/usr/bin/
> [7m>>> libxml2 2.7.6 Patching libtool[27m
>  
> Applying buildroot-libtool.patch using plaintext: 
> patching file ltmain.sh
> Hunk #1 FAILED at 273.
> Hunk #2 FAILED at 2408.
> Hunk #3 FAILED at 2552.
> Hunk #4 FAILED at 2896.
> Hunk #5 FAILED at 5623.
> Hunk #6 FAILED at 5948.
> 6 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> Patch failed!  Please fix buildroot-libtool.patch!
> make: ***
> [/home/johan/buildroot/output/build/libxml2-2.7.6/.stamp_libtool_patch] Error 1
> 
>  
>  
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
