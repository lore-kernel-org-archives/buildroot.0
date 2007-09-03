From: Ignacio Lorenzo =?ISO-8859-1?Q?Subir=E1?= Otal <nachootal@salle.url.edu>
Date: Mon, 03 Sep 2007 16:06:42 +0200
Subject: [Buildroot] Error while making buildroot for an i386 architecture
Message-ID: <1188828402.6167.8.camel@PcNacho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi! my name is Nacho and this is my first e-mail to the list, 
        I'm trying to create a filesystem with buildroot and my target
        is an ATX
        board.
        I follow the instructions for producing the filesystem in the
        documentation:
        make menuconfig and later on make.
        I chose the default toolchain and no packages on the busybox
        part of the
        menuconfig just to check if the output is what I need.
        I get the following error during the make command:
        
        # Strip the host binaries
        strip --strip-all -R .note
        -R .comment /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-addr2line /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-ar /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-as /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-c++filt /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-cpp /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc-4.2.1 /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gccbug /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcov /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-ld /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-ldconfig /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-ldd /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-nm /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-objcopy /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-objdump /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-ranlib /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-readelf /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-size /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-strings /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-strip
        strip: /home/nacho/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gccbug: File format not recognized
        make: ***
        [/home/nacho/Desktop/buildroot/toolchain_build_i386/gcc-4.2.1-final/.installed] Error 1
        
        
        I have no idea of what's the problem because the toolchain is in
        it's
        directory so it means that it's been succesfully downloaded and
        compiled, isn't it?.
        
        I'd thank some help from anybody in the list.
        
        Best Regards, 
        
        Nacho
        
