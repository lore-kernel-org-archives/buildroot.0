From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Feb 2017 08:29:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-17
Message-ID: <20170218072912.D20A720756@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-17
================================

      successes : 237
       failures : 42 
       timeouts : 1  
          TOTAL : 280

Classification of failures by reason
====================================

               bctoolbox-0.4.0 | 4 
                 qt5base-5.8.0 | 4 
                 sngrep-v1.4.2 | 4 
             alljoyn-16.04.00a | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                 glibmm-2.50.0 | 2 
                 wavpack-5.1.0 | 2 
                classpath-0.98 | 1 
                  cppcms-1.0.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
               domoticz-3.5877 | 1 
                  gnutls-3.5.8 | 1 
                 jsoncpp-1.7.7 | 1 
               libepoxy-v1.3.1 | 1 
                    libiio-0.9 | 1 
                  libnfc-1.7.1 | 1 
                 libnss-3.27.2 | 1 
               librsvg-2.40.16 | 1 
             libsidplay2-2.1.1 | 1 
                  libsvg-0.1.4 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
                     lua-5.3.4 | 1 
                 mplayer-1.3.0 | 1 
               openipmi-2.0.22 | 1 
python-libconfig-b271c3d9da... | 1 
                    qemu-2.7.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                     vlc-2.2.4 | 1 
xdriver_xf86-video-vmware-1... | 1 


Detail of failures
===================

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/684c01d00d1f3226ee0e9c79c83033db56324615
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c486397a6a99f6b377cfc0d971b716fe5d69f662
        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/c867ec6b9c0e80cc9436cf02ac810379815bdf03
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/71c79d63b71e691102a84fe986d13a25347fcc54
        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/f65f4bcee426ef72f37b070eca9b4b6c834e9908
        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/45ffafa3382f6ecf451cc74a48b5d0d006a2a1c0
     aarch64 |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/34870e939ca9624cabec37248951562f36b223c7
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c80edb729c09b1a402e28459160501f0843d8f77
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/e4ef72df16d901796dfd4ba1c8d7dc747cd1f047
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7ffb06b3aead616ae87d573c037bee31e458d31b
        or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/50348bc5a3a77db09e9c6a631b5dbe42d32c843f
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/151b82139593fc13f8b77dccd764c4f039ee928e
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9bfde8c1cbc4a6f93a65cd82bd458c3df7cce862
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c495ed71b3add134b3a6c7f0ec4c54136f404913
    mips64el |                   gnutls-3.5.8 | NOK | http://autobuild.buildroot.net/results/9d408c9fa54e5d77881bb535063553b7d6d7d144
        or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/f3e8db6f90852855bdf7db3bd1b7c437823bbd16
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/30ffcf11e58def280208884a03ed20f7049def4f
        i686 |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/3a2a67795a952094cc5e7c76408dc9af1d6c2176
        or1k |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/520b9093bd64d563a94f8cfc076655ba6ce6f4d4
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/7007c9f17c546e8378756c4af3e75cb36afa5dc1
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/d0ebc3345d84ddc2f51c5a5f7b670f12637884d7
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/a0b2be753c447bc4069788dd773a7ab46bf37efc
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f3f22323f1eef7551e79f39d9de326fd4a896da1
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a3bcd2dddb1d1b517748d3ee1ce364944de64486
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/39b1c1a57f2c8e29d8a1e5c6b0b05490bd12a262
        or1k |                      lua-5.3.4 | NOK | http://autobuild.buildroot.net/results/e971c222e65389a07e86a6b04d922a731c41b187
        or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/577c9a089fba692161bbbf75e951bec3a7a77201
      mipsel |                openipmi-2.0.22 | TIM | http://autobuild.buildroot.net/results/81134e699d5bc93df794445b3a816b972c667442
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/c49ed85bb317a5c4c6d0a08664635201910a0410
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/7d85473ef9536d37c22c9f6077c3118ec6e22da0
        mips |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/0313ad3ef569f1b0c4594a25b33848c8df2ae598
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/099c6f300a20600e18ab12e0b429ea241c8b3525
      x86_64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/bc8c12442013f250a4ba8f93bd2655e145af1327
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/37a5eeec32fda144468dc39b7d32f9cbd794090a
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/190f66f0e5c5f68f141fd7e1432498f5f779cb61
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6bd35dd0b824b44ce1fff5b65ac889b308ab2b65
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/1133bdaec144350fed7b6b231e5af41c49aa299d
      xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/faa737bed2307e0de03bcded5e3fd43a621aa3c2
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/bc4272f21767d64de6ab0e83da266d9ca5a5bd2a
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7a8ab2c880c341ab7c8f64f01b9e621202bf337f
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/ee9a1003a114681cf918678e20a4c94de0741a1e
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/731ac30463f91c3ba1ce6661251dee078c73a212
        i586 | xdriver_xf86-video-vmware-1... | NOK | http://autobuild.buildroot.net/results/faa49fd7ecaa986e8cf45863b106d379ca07943d

-- 
http://autobuild.buildroot.net
