From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-18
Message-ID: <20140719063013.190CE101205@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-18
===============================

        success : 104
       failures : 33 
       timeouts : 0  
          TOTAL : 137

Classification of failures by reason
====================================

            host-python3-3.4.1 | 9 
          google-breakpad-1320 | 3 
               libglib2-2.40.0 | 3 
            python-numpy-1.8.0 | 2 
                  opencv-2.4.8 | 2 
                   lcdapi-v0.4 | 2 
            libserial-0.6.0rc1 | 1 
                libmpeg2-0.5.1 | 1 
                    fltk-1.3.2 | 1 
                 wayland-1.5.0 | 1 
          perl-gdtextutil-0.86 | 1 
                  perl-gd-2.53 | 1 
             lttng-tools-2.4.1 | 1 
                 httping-2.3.4 | 1 
            inotify-tools-3.14 | 1 
                 libfcgi-2.4.0 | 1 
      libva-intel-driver-1.3.2 | 1 
                libcurl-7.37.0 | 1 

Detail of failures
===================

    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/660e47a9f1ce674628d19e8a85d85040dc400414/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/03eca0ee045fe852c2624c8e51387bfad61cc771/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/5abdf4fb975baa849425315c4d6a4068e0813842/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/394eb0116193217308da3bbc4a66fed2e46f9867/
      mips |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/0daa59c31a9acca5e6754a4f1465ade63bc1f61a/
   aarch64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/6ad93c67ef76d8040e253be1b21a8e008652045f/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/e87686cefad3c832e231a1f65ac81dda3aae03ea/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/2b0b42d59ddefc86682e86e2f134a00c31f90415/
    mipsel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/ac5404866b8805e4f8dce71ad72f14923dac5f35/
   aarch64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/32940a9b89031aa94c0f8d05864ea425a33affe3/
    mipsel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/990cbff9d19acd1286cf8a853704be2ceba476ee/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/9bb7b9c2083236c3b89e962daea642edf31a4ca7/
      i686 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/497d91354fca58f138039bb7e5de1f57c7a810b8/
      bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/84382290696e72c23995f5ed020ad5c157817012/
       arm |             inotify-tools-3.14 | NOK | http://autobuild.buildroot.net/results/53e98db373ee0218329a5a9c418f10d7b056b5d3/
      bfin |                    lcdapi-v0.4 | NOK | http://autobuild.buildroot.net/results/b5c7739a56ab51a99251294854d090f0ad099876/
      bfin |                    lcdapi-v0.4 | NOK | http://autobuild.buildroot.net/results/6fd65b3fd7d6f439ed14dc38fb28ad3e8e6678b1/
      bfin |                 libcurl-7.37.0 | NOK | http://autobuild.buildroot.net/results/96539a90076b8cc02fc0aebc7236a1cedcf5d523/
       arm |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/66e19cfd5a6048d2aaa46365518ea875e0abcb4d/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/53808bab32562ce673b9bd8b9a78216dd4d40a58/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/a1a1f97a2c54ba4f7f7e44cc094a55bd23ca0aa0/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/55cb07e70ce84412a6275465815a3b9d96e048e9/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2cc212c7e4bef887ff7e85ca004511e5b11b6a1b/
   powerpc |             libserial-0.6.0rc1 | NOK | http://autobuild.buildroot.net/results/6c88bdfcce40b6cbdb3e0c851c1f97f2834cd0ca/
    x86_64 |       libva-intel-driver-1.3.2 | NOK | http://autobuild.buildroot.net/results/896010d8a9ef978386ea1af8e21f5999a735997d/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/fbbb9076101de76f9024f98005c6a15330fb81d8/
       arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/729dbfa730cce34e1316126a69de9951c6ea7be0/
      bfin |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/75db3827ec4be8a3805508a22b8b6a4d1a3b9ce3/
   aarch64 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/c80d549e38bfa15e19bec7ef226c0120d4adb6ab/
   powerpc |           perl-gdtextutil-0.86 | NOK | http://autobuild.buildroot.net/results/6a89ac18c44490fd25792c39286acbf6c4830e60/
microblazeel |             python-numpy-1.8.0 | NOK | http://autobuild.buildroot.net/results/327c85f5b1849d390fcf0727cf48e621b946571f/
    x86_64 |             python-numpy-1.8.0 | NOK | http://autobuild.buildroot.net/results/da859ef752dfd2a343869c7a77324926f2a33af4/
      bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/5a0345e6a6dcdef51b606f203cb527b469c38dc8/


-- 
http://autobuild.buildroot.net
