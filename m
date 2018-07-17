From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-16
Message-ID: <20180717060022.B9C15207AB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   0 |   0 |  29 |
   2018.05.x |  19 |   0 |   0 |  19 |
      master | 128 |  57 |   0 | 185 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 11
             gnuradio-3.7.13.3 | 10
                  boost-1.67.0 | 8 
                   wampcc-v1.6 | 8 
               pulseaudio-12.1 | 5 
           cups-filters-1.20.3 | 4 
                 opencv3-3.3.0 | 2 
                  samba4-4.8.3 | 2 
                busybox-1.29.0 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
               mono-5.12.0.226 | 1 
                     php-7.2.5 | 1 
              wireshark-2.2.15 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d90a1161a40de534b81b981b7ddd0756c9b81606 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7c9618fc8e01b119d0bd11423ba9718c0dc01ee2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/273609edfc16dab624a048b69a01434b4149dd74 |     
        or1k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f9ef6163ba464d3d6e046b5520de347b6ccd2565 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/91a3c0bea34cebd5dee402b2b0832dc3fac0bab2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/57d7fd885a8a7294d772844dba1c12f7ae172235 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5a1f6642b8120bce17038d4eb657f502c37ec430 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/02ef72dc601c9017aba2ed0a083b193e1aa18424 |     
      xtensa |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/3ffef225e42b61d4da0ae59112071a24f332e535 |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/8be304cefeb851007b78b4fee3463a8d3a2642cc |     
         arc |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/44c35653b4cfea679361f7056e820392fffaff78 |     
        i686 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/de7ef411d5b9a225020b490eaa0fde94b2426b3b |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/3b82508410fd54f36a9a7901363ec8f34ec01470 |     
  aarch64_be |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f73545fffc6ae1ab0bc69d6aaa0225eb1f163396 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d713e18ff578fc2d0426d3da8a5d34bf5b014633 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f180fb7e0dde714fc27dd01367fccbc4ab37f82a |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cdf81fd146f48da2dbf0aee36d3947ede22e7c96 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d5ae605379096653407f0e8f514d53869d92ed74 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/54768e9c008915caf46e4cb8ee6c1ea6297bf979 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/97366ac31fee6553b1b8a23fce98688821c2478e |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a3ef4b599414c53fcd8db94fcaee3171918d1cd4 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/91f01b36e54ef1243c4abd25da18a16a0d995778 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cb51e6dd5e3acd913028c75c774bc6369491ac8c |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/e8bfad862101cc36836658b8448ad5e7fcb10b15 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/ee88e6020b95c1de5efee73af13ad67c47f60cc9 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/998c7949a010595f17601662f581ebf1fe8cd413 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/4036adc743414f30246867efcb35922c0db8b09c |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/f922ec97fb6284a3dc6fa49023bbfa97a3559c2c |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/809b861f090516832a9cd98efa6b99a93574c544 | ORPH
       nios2 |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/e3ecb1b9b6e9eab9595088f7c1c70e19365655a8 | ORPH
         arm |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/1a421918b66945eb78c8b7d4b2fabc7563422aec | ORPH
      xtensa |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/c280baeff0d01bdcc8f89029d0a08394a782c3f5 | ORPH
microblazeel |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/c8d3822ee34d0bbcba14eecc8524c8c865c85c1b | ORPH
    mips64el |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/d8ba491acbd9b19551735271f8c77ec2bf3f900e | ORPH
      xtensa |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/35ffd0e06e5dff8aaef79c2bd02ea46984fb2959 |     
microblazeel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/2ede8be9be059477ff346a3484f3c605df30d23c |     
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/2029f42ae83de9df61fb0f4dabd4de7faa515f41 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/4b6ce6e306a7f3c69182d443c08e505c01c08ce5 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/69e5e06cee0c8419f74104fe21121e5c42b87a12 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/2a5775d78051f9a3ae55fdd8402d0f3fcd325e0e | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/96235ff96834820a2c0dcc71fbe9b74c9ef62713 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5f0aff689e2f1e5f2f84515d8f45476386a1a244 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/33bfb9e197b47cbd1860c1d309a9ff8a3a4cae63 | ORPH
       nios2 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/38abe4379f1bcad4b2cc8c2f0de77eb03f81fae4 | ORPH
        i586 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/cc2a3b4968eb3b26fa522bb22ba9230b6cc48080 | ORPH
        i586 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/2f6ac1663681b702538a2163a02e030880075eda | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/d54ca32bff88703e5c31938e29a46670d8ba0529 | ORPH
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/7a11c4be0080e5e2b19b451323fefe9065f2cb22 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/ff9ac5d80402144d899109c76bc5dd32033582f1 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/bb6b5823132f8571db460d1155f972f19448c33d |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/1bf582b6e504297cf9925afbfe27b7be361b1871 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/fe53cf9b97e497a45c880924f41d261eed0ec9c0 |     
         arm |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/705b0a48a16cc2bec9e75f0e66040b6283c7c8f0 |     
         arm |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f63bd8f2d247c47de2c8d73f28936d1d0c24fd34 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/400ab5bbf1aac005aa9abc635b3438c3a276492e |     
      xtensa |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/dc695a05ba0a61ee7dce6f39e5545073ed0b2482 | ORPH
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/8555607c8dbe1d48edd0ec93495348abcdd0fc57 |     


-- 
http://autobuild.buildroot.net
