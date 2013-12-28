From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-27
Message-ID: <20131228073009.0C3D910103D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-27
===============================

        success : 84 
       failures : 47 
       timeouts : 1  
          TOTAL : 132

Classification of failures by reason
====================================

                grantlee-0.2.0 | 5 
                  libevdev-0.5 | 3 
make: *** [snmppp-legal-inf... | 3 
               xenomai-2.6.2.1 | 3 
                    ola-0.8.32 | 3 
               alsa-lib-1.0.26 | 3 
                 cairo-1.12.10 | 2 
                  libogg-1.3.0 | 2 
   host-gcc-intermediate-4.7.3 | 2 
                  thrift-0.9.1 | 2 
                   qjson-0.8.1 | 1 
               qt5webkit-5.2.0 | 1 
                 libraw-0.13.4 | 1 
               ruby-1.9.3-p484 | 1 
         dvb-apps-be76da69f250 | 1 
                aiccu-20070115 | 1 
                 cdrkit-1.1.11 | 1 
                  samba-3.6.22 | 1 
                  libv4l-0.8.9 | 1 
  toolchain-external-undefined | 1 
                       unknown | 1 
                 pixman-0.30.0 | 1 
                      icu-51.2 | 1 
             util-linux-2.23.2 | 1 
              python-pyasn-1.2 | 1 
                directfb-1.6.3 | 1 
              cryptsetup-1.6.3 | 1 
                  bonnie-1.03e | 1 
                  libftdi-0.19 | 1 
                  sawman-1.6.3 | 1 

Detail of failures
===================

    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e83a9c933150863f930281c38d2456a9239ea12c/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e54640ab72f5f9b2b3caa8a7eedaf975572c4a7f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/884846bd8c5043d24f7193c60f715a67f383a734/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7963b0811afcc91fe3bdce57138c08797e7519ca/
       arc |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/fa375055173f2b52e1fadabf46d8fd8ac2224408/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/934a525d4fbab61773234a4ca8a672e6ca679521/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d054b83b77d6fe0675a48cc7692d620a29713df4/
       sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c2914a4067dc1d2027c176ea4711396ea7b64512/
      i686 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/ffe401f32fca8e735ecc56fed979282accb45262/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/afb38a91907bf5a5f42562f9ebc50fe587e8464a/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/c21fdc2b4e6564e4d557380e5e86aba0d78f1364/
    x86_64 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/150833f3916bff30dd1e4d846136605100ad1313/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/db4a67cd0c830f757104c956dcf297ae545f037e/
      mips |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/7915534a8c1fcee41b2ea8983b49c9986c916e35/
       sh4 |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/7b2508a6dff80a4523c04a8c0b7e0081c34734d3/
       arm |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/55ffc55fad2eff67e3aa71046b0f2917cded04f1/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/4113c4cc98d1a57a5ceb7f6c8754cad921b307ee/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/694ed1cb5cae1eafd5dbea4e7acea013046060bb/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/63087b77ae5bc762c167c338ba33dd9e7329e567/
   powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1f5c0689ae129ae5fa30f31a4f47ccbd7705ff00/
   powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1729043d9c977a59a4fdd7ccd3d16cfc8aef7678/
   powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/3ab080e96576e0012fea853009811247338e665e/
       arc |                   libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ffcfd7da450b4fd2dda695e619f826184c4f8e87/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/2dcb25c2c76c2c6862aa3eee6940fc7e7ca653d2/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/683b8c5cca85a3645a63b1bfea89fd18d20e6759/
   powerpc |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/e6f1d553a19ad8d2900280762015456a6453479a/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/84e54c4585b3255523f91c9642b58c5d7465090f/
   powerpc | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/a1653834d24cecc5e3bd1aded78811b794126963/
   powerpc | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/c99120ec2f33d7d05dfb4b4a5338e0a4ce1d9d4c/
       arm | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/e64c3edcb00132620b07ad815c6e4d33b70c262f/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/7c6aae3a50e50962db02b63306f47bee755b1b1f/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/54deb02959e1c011c3971b23f409f47c285a88e4/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/4d3d5129fce43647f781223e223ca22cd348e1b5/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/e1c86da68e012dfbff345436b0967d7774c9d9c5/
       sh4 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/e752f49801fee4437abd832ab860693ec02d8135/
      i686 |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/feb157b89dabbd1c015e8e101dd014c314d21301/
   powerpc |                qt5webkit-5.2.0 | NOK | http://autobuild.buildroot.net/results/c286405d6c1d98a7de64bd41be3f7fd60add5007/
       arc |                ruby-1.9.3-p484 | NOK | http://autobuild.buildroot.net/results/3fa61bca4d5505d757a6c8a224faec13412e020e/
     avr32 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/8d7ff5a502bd66743287355ea773724591cc9bb7/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/5c3c9c8b7098eb79fdc46609e25dd19147a5cde1/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/340f94f0f760f3da0a269593094a674c7a93d642/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/72bcbffe81819f35432a9446954c916c6afe6880/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7c79da453b70fceb3500ac08c382d396141d8f62/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/2405d1ac06e8fedc2e07a810c3e9d9c723792e1c/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/263d1bd541b7bca7d1e4cffc02fe275c493481d3/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/e84e0d9a8048a6b14b8226c48edee65cbcf48a68/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/cad345df791fa6d1a1e6990597f9c8689e433b07/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/e3b534dafb6dd7d788b0c3629ccc0b25702790f0/


-- 
http://autobuild.buildroot.net
