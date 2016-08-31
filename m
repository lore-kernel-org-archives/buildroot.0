From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 08:30:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-30
Message-ID: <20160831063045.1CF4F1015B4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-30
================================

      successes : 195
       failures : 50 
       timeouts : 2  
          TOTAL : 247

Classification of failures by reason
====================================

           libvncserver-0.9.10 | 3 
                    mpfr-3.1.4 | 3 
                 mplayer-1.3.0 | 3 
                    lftp-4.7.3 | 2 
              libarchive-3.2.1 | 2 
                 mono-4.4.2.11 | 2 
                rsyslog-8.19.0 | 2 
                  trinity-v1.6 | 2 
/home/peko/autobuild/instan... | 1 
                acpitool-0.5.1 | 1 
           aircrack-ng-1.2-rc1 | 1 
                alsa-lib-1.1.2 | 1 
               binutils-2.25.1 | 1 
                  boost-1.61.0 | 1 
                    cups-2.1.4 | 1 
                  fio-fio-2.13 | 1 
                     flite-1.4 | 1 
                   glog-v0.3.4 | 1 
              host-cmake-3.5.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
            host-python3-3.5.2 | 1 
    host-xlib_libXrender-0.9.9 | 1 
                ipmiutil-2.9.9 | 1 
               libupnpp-0.14.1 | 1 
               mosquitto-1.4.9 | 1 
                 omniorb-4.2.1 | 1 
                  openjpeg-2.1 | 1 
                 pixman-0.34.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
               qt5base-5.6.1-1 | 1 
             rabbitmq-c-v0.8.0 | 1 
          sane-backends-1.0.25 | 1 
                sysklogd-1.5.1 | 1 
                  thrift-0.9.2 | 1 
             tinymembench-v0.3 | 1 
utils/CMakeFiles/testpat.di... | 1 
                     vlc-2.2.4 | 1 
               vo-aacenc-0.1.3 | 1 
                     xen-4.6.0 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

         arm | /home/peko/autobuild/instan... | NOK | http://autobuild.buildroot.net/results/12233e4122456d3287810d452e8e2351a11f041b
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d01635bbdb9285c42767f8b626d295740ead0689
      mipsel |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/a54ab020d4ada1ad71a471987641a46c883bb945
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/a4d8859f5f7bd872266efd706f2e111be153c7f0
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/9495f465b442f192639ad2e6c5e3feadde216eeb
    mips64el |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f90d6ea68ca3853ba5260b1abe022afe62a00b3d
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/8a94ac6afcac6582ecf363eab9cf88860b4ef9ef
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/5449e786fad4869cca4ce422c94024570ad56df7
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/466eab7136e7d9012ef0309932c5a79438eacb27
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/5c0f1ad33a50d7f64878500eb5410688b34a897f
     aarch64 |               host-cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/11ac5fa9f067a2e4f88f0fd8a82110bf910c30e2
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4a957310eee2c8c7f5f255984493142ad835eef4
     aarch64 |             host-python3-3.5.2 | NOK | http://autobuild.buildroot.net/results/59d76d79a86573099d4863e6a21988987c3219c8
         arm |     host-xlib_libXrender-0.9.9 | TIM | http://autobuild.buildroot.net/results/e21b109c326c9371cce0332073e4e572bc87ddd4
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/65e30b43463f02e718e5564bebd0d8fdb23d3d30
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/5c08515810b4dd6ff98af46090069c2348a056f0
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/2a8674ef75b59344a4b125289a1b9c82a8adc391
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ea70db5354f07fcdd74ec590291cf0c73744a0ad
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/99a77d4abe6c173a1b8631c1cdf069281928fec2
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/7dd6a1af25e808f2ba906ef4899befd2b86b34b5
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/a8e59fff05257e94b10fc20fccc6121addc8c2bf
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/61002e6f089bd09af7a363dd649081707500abd4
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/62adb96afde1b3ac7fc7a17a9d2f7f1fed0a77d6
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/0f9267f68901225c814d5708a7e4677170fbc858
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/8ef0286d439084ae61d3c62001397e2d61634c23
microblazeel |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/69f60d6bdc62cc95eec0882dcb5236e70c29cf63
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/91262264a5439d354f716028636ba7fdbfb09087
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/8b52ae84dd73403380a04f1304a6a79caa22bac9
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/4181d68f426f15867836878fc081607c10f7aee9
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1bd89ac04ad2d269c3bf998e594b71c2d10dcf14
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9b803a0873d35ca18f11e5869219e40d7463240e
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/38cef919eccf38d0651475c34ba303054147830f
        m68k |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/8d86d15d94cc713b8af9aabe01179e9b93646d8e
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/c3dd97de1a30b3186664088eb180b224381f4b09
        m68k |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/486a4307efb17ed1bab9677253b4e88f878453d4
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4e75dcb8fa1bc63919f25792c56cbf655e7c324a
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/5d31a0a8dddc37b01c1d17142d70c0b7c4c8c2a4
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/f8fefadc8d5315a2caba5d6b33e3e2a718f7804b
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/dd7850d54d62ac94631126684791397009124f7e
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/e57bb9ee3ef31a2b2af4d814b3189ce2de649d97
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/6a1778e4966a0f634bdf60570f61d9b6d1fa1a05
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/da00566ba64d3bcbb3d5843d84bdff0a4140192a
      x86_64 |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/a564491538e180842e0817e9d8f602d2d36a1000
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/baf7cb37d06adf4b6f9e25ad4208ea09d3758d24
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/958eade80444217953936d81b1d946da6d784b91
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/bf3d8ff532a93f24851958729c7c876d143191b2
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0e32e31439379835900663be6dfbe3379564b672
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/4e17fa44bb7c0fb687584e0143e982bb627da3a8
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/160f1df8863c543e890db08b1b24dea0cd505859
         arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/6345b4c491fca952cd692844e3ac2932ac4836dc
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/dfba04f5ce9cc76c026ec1a9d70e5f47f8169eca
         arc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/51923eb1f291ef0411083d3c548b734e4a835ff2

-- 
http://autobuild.buildroot.net
