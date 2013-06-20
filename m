From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-19
Message-ID: <20130620063006.44F0752C0F8@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-19
===============================

        success : 88 
       failures : 56 
       timeouts : 1  
          TOTAL : 145

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 9 
                 libffi-3.0.13 | 5 
               openswan-2.6.39 | 5 
                 cairo-1.12.10 | 3 
               libglib2-2.36.1 | 3 
                  prboom-2.5.0 | 2 
                  iozone-3_414 | 2 
                     m4-1.4.16 | 2 
               qt5webkit-5.0.2 | 2 
               wvstreams-4.6.1 | 1 
               host-mpfr-3.1.2 | 1 
              matchbox-lib-1.9 | 1 
                 binutils-2.21 | 1 
             lttng-tools-2.1.1 | 1 
libtool: link: warning: lib... | 1 
                   cups-1.3.11 | 1 
                    fbgrab-1.0 | 1 
               alsa-lib-1.0.26 | 1 
                  sysklogd-1.5 | 1 
           imagemagick-6.7.8-8 | 1 
                 libpfm4-4.3.0 | 1 
                directfb-1.6.3 | 1 
                wavpack-4.60.1 | 1 
                 libiconv-1.14 | 1 
                      qt-4.8.4 | 1 
                  ne10-88c18f0 | 1 
                      bash-4.2 | 1 
                 libevas-1.7.4 | 1 
               libsigsegv-2.10 | 1 
             iptables-1.4.19.1 | 1 
                 qt5base-5.0.2 | 1 
                   icu-4.8.1.1 | 1 
                pulseaudio-4.0 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9b52b60e643f9a8670c5345bc6ade9f34dcc8e08/
       arm |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/09016328027e78d41b40d732995490fe50f0106f/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/74873f79c484813c30f2ee5df824c700a348cb5f/
   powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9955ec633a33d6d27ac574f47f34ed020a0fd59b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/858e3c15c02894699c39ce42404dc8d1567a2931/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7a291e129ad4f9ad697c4929a3017aba228b17d2/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/289485070991968ef268827d17ed853354d62b2a/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/91514171b803402019a02d14a838c8a787283789/
      bfin |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/8bd06e5faf0d1ff33992573a89148eb2500d322b/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/4327b87aadf661d2eb8d37de36262f2f864a22ad/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/374662b139cc467d602a95ec96b135f207775f74/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/862cf952d8f94d3d7adfd8bea1f3890f9e1871cc/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ddd6ac182d4701358c8cf517102765353f55a734/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/1b74cdd2c21f1a35eae613f1cea288ce318036be/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e2f2204ad4b6820185a16bf2816c38689392690a/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/621f5e88f8857c8927e464528fd5a9c7aa81ebde/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/f9f6c21bda45ec99cf9e8ab02f121cd8b3360bf2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/de84c4505b7210c54f61ae5b43791d617ed2dc62/
      i586 |                host-mpfr-3.1.2 | NOK | http://autobuild.buildroot.net/results/9ddf762e75d6091f22da33fa2c66f65dfadb0072/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/2ef8fd4b2114dd3daf01073749a9221f961580dc/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/8af671126fb49b0b64533eceef8058062bcde157/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/0bb0c8021d48c1c7c580e661fcc1090495f9ef91/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/687227bb1cb6e3fd453ee5042b248104cd55b9cf/
      bfin |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/a60257a4c8805a7a7f975e97a1fbc5d4dc43060d/
     avr32 |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/28397c9f70aa6d67e7494ff639e7ca34107a9981/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/48ebe95046fddc7dee1f3b1113eccb8a5921ca38/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f7b1911bf24f26064f538e941757a120704fd888/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/bc1d3ce816d4423fdbe7565692ea660aebc3e4df/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/639f0287557e018b9d293a5c1622b3fcf9b0ee7d/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4c65efc00c6506249cb99aaca2110c8302f4d1e2/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/b232291a25e4e58bdb73b06b11b79d02c5b2f917/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/66ac6909b9dc19e97c853851e05acd95e9b17c4b/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a8b667777a45a4ff88eff48c41c9d04acd32b4a9/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/5e34cadd65ef94f7e7fbef936d67f7109485a745/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/cf20a4726b0ee234c91956f741e3f1dee875a435/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b4f0d40b347a558c942ff2a645770b326fd8014c/
      i686 | libtool: link: warning: lib... | TIM | http://autobuild.buildroot.net/results/b99733e32a52514987b708c370a0f0beb1288295/
       arm |              lttng-tools-2.1.1 | NOK | http://autobuild.buildroot.net/results/2ebd2f996ecd732b829c6067f292c49f3cad9216/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/957063d8501e581d2eca9a23092f650358055f9c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/8a4ba25373c56084e37657e1765b86c7c7d5f4fc/
    mipsel |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/29454582f4f64abc9840e8eb42b3c15058612969/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/ed68b4db77cabd1fb4f3f9469dd53486346e4aec/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/4c489da720116fa3ce908562480825c9bdb5b9f5/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/f78df4c29bcd5e1e3c64fe19c151fdac88197dff/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/e04f9889a9e7ace8087d59dbd2282b38cc52844f/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/be38b59ea08833b9b8ec7dc93e2f803aff59e2f1/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/d41e03ac79c22448c89c61f299d707e1d4c1a791/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/7a8d52d9d1480f0cd3ae8b7ba0b323b28cc2c7c8/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5cf4dd5946847e8180f672aeba530931898f455e/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/b5f6d957576317591d4c13f9ad0d2c3623f808ee/
   aarch64 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/eab0d3a41a6b50518c9aace773b41b453b8cbe2f/
     avr32 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/29a98305c52ccc1f32b6cd2d05465eb0eb6c4e2c/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/051c9a5f8c8de23a485acb80b955d0a1e6345ab0/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/16adaf9b4929e1b30c96daf7475db880fdc34d27/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/c2c4a427c550a1612d4542c5750a48ffbc5334cc/
       arc |                 wavpack-4.60.1 | NOK | http://autobuild.buildroot.net/results/e1736f5c3be5c44ba63d8b2cc2fb73e2b309bb18/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/33b63e1563c6059b7d0cee30794a0969aa8420cb/


-- 
http://autobuild.buildroot.net
