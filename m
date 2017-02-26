From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 08:28:45 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-25
Message-ID: <20170226072845.0954E20755@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-25
================================

      successes : 197
       failures : 20 
       timeouts : 1  
          TOTAL : 218

Classification of failures by reason
====================================

             rabbitmq-c-v0.8.0 | 2 
                 sngrep-v1.4.2 | 2 
                   assimp-v3.2 | 1 
                classpath-0.98 | 1 
               domoticz-3.5877 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
make[3]: *** wait: No child... | 1 
               nfs-utils-1.3.3 | 1 
                     nmap-7.40 | 1 
                 openocd-0.9.0 | 1 
           oracle-mysql-5.1.73 | 1 
               pulseview-0.3.0 | 1 
python-libconfig-b271c3d9da... | 1 
                    ruby-2.4.0 | 1 
                  samba4-4.5.5 | 1 
                 synergy-1.3.1 | 1 
                     vlc-2.2.4 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ec88aa8118179e30e24603cc45292047dca19216
        or1k |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a0bb5535fd197b9dd1607a5f0bca477c9575c99f
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/8789303587f693d5104506a7db361e1322091fd1
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/4612d35704070256cf11455e4f4cf23272bf107d
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/3f3593bab7734dd274faf5b5690895e9424cbb89
microblazeel | make[3]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/536ade4a109eae7dec48887fc23cde56c12a4de9
microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/b27f37190ebc7cd1121d0b040dbc8acbef66d749
       sparc |                      nmap-7.40 | NOK | http://autobuild.buildroot.net/results/8e476939f1daaa20c316dbd0508fa343034f2397
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4
 powerpc64le |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/767f0be3894c45c1e6d18bc4528d0da7b50e3757
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/a8a8bd2097a20f611bfb8c9679a4f69ace05f533
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f0f6cdc8c38c024772615d5e677b0f4ad63ef7ec
      x86_64 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3dc981444ba3376df04878866f951e3e4bb31323
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/74b77125a5d1bb7340cb6901836430b1ad8acb29
        mips |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5856446247100e0e4cdbba7f633ac823ccf18a13
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/605e36d65bd01310913701af0f9ed1e11fb49385
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/99aa6a0ce6dd55911b612ae61180cfbaece64580
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c58961fb9c67dbc387d9cb785d78641bfaa5333b
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/05bbc22dd6cd5564462226e612ab1e95778fe935
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52
         arc |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/50314716a9f72e8bb238e52e9dc342c68f7e0b8b

-- 
http://autobuild.buildroot.net
