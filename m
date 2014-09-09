From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-08
Message-ID: <20140909063012.3F626100DE5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-08
===============================

        success : 183
       failures : 27 
       timeouts : 2  
          TOTAL : 212

Classification of failures by reason
====================================

make: *** [core-dependencie... | 4 
          perl-net-ssleay-1.65 | 3 
                 webkit-1.11.5 | 2 
           heirloom-mailx-12.5 | 1 
make: *** wait: No child pr... | 1 
                elfutils-0.155 | 1 
                php-yaml-1.1.1 | 1 
               iptraf-ng-1.1.4 | 1 
                host-gdb-7.6.2 | 1 
                 libraw-0.13.4 | 1 
                 cdrkit-1.1.11 | 1 
                    ruby-2.1.2 | 1 
           libmemcached-1.0.18 | 1 
                 libssh2-1.4.3 | 1 
                jasper-1.900.1 | 1 
           xapp_bdftopcf-1.0.4 | 1 
              libgeotiff-1.3.0 | 1 
                    strace-4.9 | 1 
                 gnupg2-2.0.26 | 1 
              host-erlang-17.1 | 1 
                   ulogd-2.0.4 | 1 
                 python3-3.4.1 | 1 
                  zeromq-4.0.4 | 1 

Detail of failures
===================

    mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c3460bd0a3aa1ea7e8de98e413edb36909e2549b/
   powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/5198d911ae2f53f7fb49f329d21834e1e10ee542/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/0abadc3f63c2b742b4aa588b361c43725176ac0f/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/d3e6ade4b6b7decea3c9504cbe03906893e6a2fd/
      i686 |               host-erlang-17.1 | NOK | http://autobuild.buildroot.net/results/0365242dd1756bb586cbffecbb7e04eb9bf22d1d/
      bfin |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/153dbdc42103074f7a0895e8871e2eee4eae3325/
      sh4a |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/fa73df11267b2769bfeef01b14a17f6c05d2da22/
    x86_64 |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/dd71c8f5afbd15baf5a3718223a82cedec23679e/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/76d9700334cdbfc244fb88bcca20a812952d2c62/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ea653c5ed41895628f266832549444e426b91dc7/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/1a72bc34df4de85237161d695b7c69ed62c51790/
      bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/c29a32e8616ab6a03f2916faae2a4b356af7f43d/
       arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e026eda76688bc3bb3c041ef52981f22ae9e80ac/
   powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a33cd454e2480f8a4c81b494f1eb74f743c2d44e/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/4b459969273def17209a5b973fcec1476a8d1d4e/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/bc2bb0e85a82b19179e0f00fa268fd977a74100c/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/4eb10a43bfd49af59bc42fe1a6866aa21ee568e2/
   powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/1dc97bba33930d57f425df6d2519b33d83ead5ec/
  mips64el |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/123910c76af55070990a9f6072e50245e3f11c81/
   powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/2dc4e5d9d226a65e5a4808287bd423cae3e40128/
    x86_64 |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/0c14db9e27dc665f1ea568e9b73e8aa6c6c9520e/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/0d284b9d041b787f5b41b54534253d6925e80df1/
      bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/90ec9bd521dbcb70e9a20f1ccc9e02f527ac7bfa/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/3cab60f16b01537d770eefb2ba570ecb001c5e8a/
  mips64el |                    ulogd-2.0.4 | TIM | http://autobuild.buildroot.net/results/0917ef6e0ffef9f265dfac7e098488ebec3b17e9/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5c189a4bb0d356aa908944ab4b8a5e77dfad561c/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/8936b67994e69f232f3e81069d6369d73b90575f/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/53a9df4a7d47ad2c390233269720a498bfe9e83e/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/43f4a252ca85eee523496486ca96de1d3ed99ec4/


-- 
http://autobuild.buildroot.net
