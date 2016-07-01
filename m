From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Jul 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-30
Message-ID: <20160701063025.9827B1024AE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-30
===============================

        success : 174
       failures : 99 
       timeouts : 1  
          TOTAL : 274

Classification of failures by reason
====================================

            host-python-2.7.12 | 16
                   efivar-0.23 | 5 
                  boost-1.61.0 | 5 
                pulseaudio-9.0 | 5 
              libarchive-3.2.1 | 4 
              libdvdread-5.0.3 | 4 
                 lvm2-2.02.158 | 3 
           linux-zigbee-v0.3.1 | 3 
            lttng-libust-2.7.1 | 3 
              e2fsprogs-1.43.1 | 3 
                pinentry-0.9.4 | 2 
                 dmalloc-5.5.2 | 2 
                     php-7.0.8 | 2 
                 mesa3d-11.2.2 | 2 
                flannel-v0.5.5 | 2 
                cifs-utils-6.5 | 2 
                  autofs-5.1.2 | 2 
               target-finalize | 2 
qt5webkit-b889f460280ad98c8... | 2 
          libmicrohttpd-0.9.50 | 2 
                 mplayer-1.3.0 | 2 
      kismet-Kismet-2014-02-R1 | 1 
                  multicat-2.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             fxload-2008_10_13 | 1 
                     gmp-6.1.1 | 1 
                collectd-5.5.1 | 1 
               linknx-0.0.1.32 | 1 
               wireshark-2.0.4 | 1 
                     vlc-2.2.4 | 1 
                grantlee-0.5.1 | 1 
make[3]: *** [all-recursive... | 1 
                 weston-1.11.0 | 1 
                oprofile-1.1.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  cairo-1.14.6 | 1 
                  gamin-0.1.10 | 1 
                   fwup-v0.8.0 | 1 
                     dtc-1.4.1 | 1 
               libsigsegv-2.10 | 1 
                    lftp-4.7.2 | 1 
                  apitrace-7.0 | 1 
              lirc-tools-0.9.4 | 1 
                   ncurses-5.9 | 1 
                  openjpeg-2.1 | 1 
                   erlang-18.3 | 1 
               libdvdnav-5.0.3 | 1 
           libvncserver-0.9.10 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/df6f15c02bdfc72a4bb0eac73bdfae9c1f6160ff/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7a432777ffe29512dd7dbb9c0f2082bb5b4a1198/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/bd7b93eab4c4dadab53b1619910ca81add08a540/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/e7b87aa0a68108b64ceb64f0c48be5e4e2fcd1cf/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ce0ead4b76235b871c3cc4010fc69ec5df5182d0/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/556c12dd3dced12b6c0e496c999d7d3730fbce6c/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/79865eb6717461839b6ee5db2b1a8758672ab296/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/08bfa9d43c7cd5d38437a95a8ca7266d72a5ad2a/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/86ac8db95bcd31c3d9f5b7ba357bc492eeaf568b/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/d91546d1a0a46e0588b6c80fcb6decb250a09556/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/732612f15d816c89bc01136e76929d1e87f78382/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/03b1a3689e0bfbcc7bfa5a46e45eb212af2e4fbc/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/785cfae9ef151e01767f393f5b448e6a974fe0c2/
        m68k |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/e64029528d08bd8fc6a13055a44900f857ebce9e/
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/e35bb851609f1442b9233483b17b8d3d921d2cc7/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/751c418ddf55ee593af192185c1fdc3ddabd9951/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8fa5925cbc37fe8595af7635ddcac4b255fb5474/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/881f501af79d90187bdf2d7341ae53c9c2321d95/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1608bcb9593438a6a2a848edb88caa65801ef3bc/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b397519f74fb988a61fd95efe9edc8a528d5d7fe/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/50e56ba98e08f2e4b8f00bd3b0be0474246b73c0/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9ef6f544ce3106290abacec15ee57cca027aceaf/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1b64db2ef54179338c95bf0d1458eab7065da7ad/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1269c064ffb8ed682acab6b0c9bf8b3b84f4f7f9/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/9d8209a31e105228f48417dd35d702bb098d19e2/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/bc2bfb56f78b00dc7b25651d1c3e970a6555e668/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e389eeceb638cf3784f4d447d728d521abb04e35/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c686922593e6061b35dbb2cdbffeb11057e5bdc4/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/d5e9d2c84324d67714d090b660db1d37544f624c/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/aa24bf4a009eaf4d69c626d98d59582838610cda/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/306694504539a1ac206876f7ccf00391418ff96a/
        i686 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/3746e8a5cc39313eb6c7db0b47e276b978b8125c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/fb928b020fe83c22ecb89a07e884f2821fda1a88/
       nios2 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/24e72c5893b64ee2f1ec917373c1d362a30f2edb/
    mips64el |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/061300307acd16bc6583b584511f674b5f829e9f/
        sh4a |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/d73465a02c7e3644e625b24776136ef8fd0f6b11/
         sh4 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/37f29b6dc1c4f0909ed34b428d29159cfae5609d/
    mips64el |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/a6a92dac4f99ab3edb3c29db6f1edd25d185aa6a/
         arc |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/a5b855aa5348d7c62af9db67e4d049f0ea8d9351/
         arm |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/018303a5d551aaa6c91013ab0352437e9a2c28bc/
         arm |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/eff0b4ec65c311bb43ff077920297bc3f27dba8a/
    mips64el |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/a89ad22f18f27e552974347dbe63fe2cfacd321d/
         sh4 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/d631f41afd09d33b957e009f5bc0e831abbb0755/
     aarch64 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/d2145db82aaa8eaf826939d3e96faf08453e7491/
         arc |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/1f335bb2160636ff3ed396b78b72e71abbec0a6c/
         arc |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/20aa67dd9e3c232c54392c7d75ca6adf7f341c5a/
     aarch64 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/b0b9dea1bfcefec58e999387041cf47d9abed8e2/
        i686 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/4c848e5035d0435e0798ae9b9f68687c15a23de2/
      x86_64 |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/20aa12806f418ce97b9dc44e8a5ebf8fc75534c1/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9fd14ccff3bc14a3ac359a1bd5c5aab39bc5d640/
         arc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3677d5b80bab2f7a9ab38b70be6cb080fc901536/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/73c1d4473e39a161331712b436f0f91dd4376c6b/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/29c3df806e5b9c74e72849070285055269e2f442/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/491e0078475c4fe64613b134c40b446aa6cf64b8/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/47fe06a9ac283193d21b269b55a1a21598f15935/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/acb165ba13941530e1073685cccaeb11837a89ef/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/3092bbdd9ce404fa61f416f485341f670702d1cc/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/e220d4e2af1fe1c92fb8545599584c7717a07c93/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/d71e6cf11e86878d2cad8a9119d4050ad3a148df/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/52087f11d34eae94f1a30b35d7dd9a5e3269d311/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/2d80d346711acb88ac0c476fe0e97a7f09a81b19/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/83c172e0be1cf23501dbf4f355f225305544da3d/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9435f5ce8c96924a67e62799a3715a660d8426a4/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/940e5d799c12179227abb6336528a14dfe8e6f0c/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d95c68235be22ce7a090f990f44fcfbc71479e03/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/994dd4c87224a53c416e8722de17aa4bb3f8eb50/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/475f286300c118fc0687d73cf817af57a80b2ef5/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/26e8199717d5b7ace859e7c5fa8c7b5b1fb94e31/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/2e6ebd2807e6ae8b0087ac5b8f364cb6a6de01b3/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/aea95f213515ee4254bc035feea530b34f456606/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/862e6c5ffe039a6c04d7e69ab65c8e448f48c504/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/6f928acf0b57dbc9fb6960b412debc7f171e75c3/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/6a11ac116dda5aeb6c6a88d9a30a753562de5a51/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/d236da09334dcc8977ed22874ba313267f9b43b1/
         arm |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/db493916fd67116544a86a9e68a020785b8d8bd7/
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/1a5228b960c3e0705cdfe3413c8661cfd783ccb0/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/111d2245160cdfc9c63379a851bacd62796aede4/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/08c1827d68d713d7fd74e0ee2e1e724fee9a3c9b/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d05b438fdf40371cfea6710b4b97a3cc7175a9dd/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4a7d3724cc662b094c37d1459414c3d4cc6f5510/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/66889a7450570fe39dc96ae15f0d0f347289cdb5/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/3fdb768be8e0b1ab33347ddf7088ee12b2d3fe6f/
     powerpc |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/cd4d145f561b3d125009ef45d70b97c3af318a71/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/394556279975fb6939edbc46260f461fd65fd1d4/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/32cae3bfd731db1db96c36de3afe4cecfadde491/
        m68k |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/e50b6247856c34753b75c38ea89732ba1bb3704f/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c4fa091ce0c88f46e632bde5a33ebe19bd74ee95/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6fee55be001029670cad0ed96a41b66278ca0180/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/aab2b3e0ce2dbd535a9d29b6b4b3b053aad5907e/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/c76c02742381ff24883784d2f0f0c67278b8b779/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/968c3713689a5eb534a289ca0febff26929ed5b4/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/3557ff1d48b457866690e3e1e15d78277c0cfb1f/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/3f42086b14d87115c86fb4dd7e25dabdda71eade/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/c87d8168e0a52a0ae41b2521ff12e94afa647c68/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/f4ffc11fcfda60a45e4ad3b38af3eed164698f13/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/83522854ba07ad85b65873b1031fb14c767d4f35/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c80ac84683a9b32c12144e843fd73e170cbf9e23/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c5e184009721a23181996a45a7760dd535a1df56/
      x86_64 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/b2248d9c186fc6c07c86fd615fd6187d98e14d68/
        i686 |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/4b993476b5c065abb8125d9190cdc8f591c48034/


-- 
http://autobuild.buildroot.net
