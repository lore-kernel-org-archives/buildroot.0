From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Sep 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-25
Message-ID: <20130926063007.AEC3D52C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-25
===============================

        success : 83 
       failures : 62 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

                netatalk-3.0.5 | 10
    trace-cmd-trace-cmd-v2.2.1 | 8 
                      icu-51.2 | 3 
                  tstools-1_11 | 3 
               libglib2-2.36.3 | 3 
      host-gcc-initial-4.8-arc | 3 
               alsa-lib-1.0.26 | 2 
               w_scan-20130331 | 2 
                      pv-1.4.6 | 2 
          host-protobuf-c-0.15 | 2 
                 libssh2-1.4.3 | 2 
                 ffmpeg-0.8.12 | 2 
                    ola-0.8.31 | 1 
                  connman-1.12 | 1 
               ruby-1.9.3-p448 | 1 
               libsigsegv-2.10 | 1 
                      qt-4.8.5 | 1 
                 dropwatch-1.4 | 1 
                   dbus-1.4.26 | 1 
                openssl-1.0.1e | 1 
             alsa-utils-1.0.26 | 1 
           argp-standalone-1.3 | 1 
                 binutils-2.21 | 1 
           imagemagick-6.8.6-2 | 1 
                 libfuse-2.9.3 | 1 
                    php-5.3.27 | 1 
                 webkit-1.11.5 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                aiccu-20070115 | 1 
                libiscsi-1.6.0 | 1 
             tvheadend-2b64995 | 1 
                    zlib-1.2.8 | 1 

Detail of failures
===================

       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/fa8e46d4527fb7933e8c09b7cb58571d3e9b736b/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/42ef699db9dd4d33ef897fe8e8866038861aab69/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dd1af21f9660704025e9947924f7f9379de3162a/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/63379d298c237109e8efe4b2816718db5ba050cb/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9c2069951cb2d911257ca7082dc7c799850f6402/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/759efbeaf219fcdcc28f02a3948236d2eb9f5011/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/4728ea0ef89a61addd0a34920f3df1e15ab27748/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/0d851065878719f7e7f871e12b0dd3048ed0a8de/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0793f8810a3c0226c621a603b93b9714422bca40/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/94bf50b84dc222100c48486da5aa668e5e3a0e89/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/410ab058b04b9b569b9a382e3b63e84712bcc60a/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/8bbc35f4e208781f457eea3e21de5ef9e6f78ef8/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ee91a978c8457210c347d2bfd1680e29a8c664a4/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/23cf0b2b274c4baacfccaf665b66cd2a443e2760/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/e9eca7094a43c7ec804d4a79329721a6c6a4d1ca/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/2f68c8d29820c1b3d895a91655e4c5fac502166a/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/eb62ebf308df234ee4fd86a71ff026652be9620e/
   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f6ef7b5680b75e8a6e836c89092b4a7977126caa/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/19cf02f1e12c265f0a669c1ba0688cdb05d0664a/
      bfin |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/94786c113abb48d5c3cda8ef8175dab7d900ada6/
microblaze |                  libfuse-2.9.3 | NOK | http://autobuild.buildroot.net/results/02b00206c4126cee4e83ae82c950ea3fe347c483/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1faf367e313927208e860aeb1416e32946ad0fee/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1f637041996fdfbec912fa4eeff42c4bbfc8e63d/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/26dabe523cb1d151a83af5265d3b91f33dd52652/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/b844e2887b592446a8e85fee87d680e900df4493/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/7ce3b07eca302771ef1273957118d98492e65c63/
      i686 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/7a2590a7c3a1f52590f3e886b7cf9d04ad966a10/
      i686 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/eeaaf41c0c5f88357af8445750dce776774c2b5d/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/af8b06b663845466822fb8f64b3c367e09fbb71a/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/d175ac39a45150299944df13f9702cdb42489ff8/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/941f643a7481516267b6ffce08b00818ef63d1d3/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/8c7375aba7492e88ac3a2f5ea926cd1a11bb1b7e/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/860fe1c47790e41e1b844b63ad972016ed0cb118/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/899eb17d8e9f61d74b7a910caccbe511d4c06fce/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/f956ec19713256986c2a86ce56a30ca3da13198a/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/bb42ecd824e994388f3d1c3bff50710f0458ff64/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/1bdb09cda335f335f7c78f7704ee200b54c4ed26/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/e3c33d094a0c2fd82c6ba9b18bbbbe56d53f666c/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/608e6bb17fd33f59f52086fb27f34a575391ae38/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/7c5b86aa354b0b96fadae2fb2c5c73f8af8a4a6f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/0051b1c3f623927fec7a76f5974a8afacb076035/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/ee7785bf4e305ae1ad45b4cd2b778c931d9ba67c/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/b441843943ddd6c1bccb5d77d245933cea7cf9b0/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/8626edffc03abeb922d52cc4a0e857bfa0ebfce5/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3c8f00eef4b7ffd605ed294ddf1f6bc973c41865/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/36afe64127bc8f0ee8c72ba9882a078077800ad1/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f5590c1331a42cae28644879598d8866a4f294e5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ca50bd693d46c3a929fceae4618c68e989817e92/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/166f23883463db1a4d6b5db8b9b9f279ef29b67e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ebfb0fe7cfca4ca8e51116b503cb099df0884c87/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7f6b511673738d15d8eba4e9dd71834e83c1bf1f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/78cf3e5c09e2588ab666a81f6de5fea0f8de7df5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cc2530563a8acf308266e3733a6a79bb9ce1201a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a46dbe66985814ad4de7a143a4c8f1b7a899c22a/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e57d5690cc3fa4d53d82f9c315b72b85d17387d8/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e54cbe92b76eb651f0a8e5278f229c3b776bc1f3/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/0e68dba04d88b11561e87f1cf4703fe7f8570a3e/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/c27bcf284edbe4fe4ca003ee1cb63dbdc038dae8/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/64fbac3662da783205f92bb19e04ec200943dfc0/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/76ed5d0fc57f49e8b47d1fed61fa527c33b99ca5/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bd5745c1d061e09c6eea489f5cfa1fac36d4901c/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/b27f47d2b3f6ff679f797313fafc9be7a8a60288/


-- 
http://autobuild.buildroot.net
