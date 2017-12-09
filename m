From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Dec 2017 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-08
Message-ID: <20171209070009.217D3209F2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-08
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 221 |  34 |   1 | 256 |
   2017.08.x |  19 |   2 |   1 |  22 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      fastd-18 | 23
                   mpd-0.20.12 | 3 
                  boost-1.65.1 | 2 
              host-erlang-20.0 | 2 
              dovecot-2.2.33.2 | 1 
                 ibrdtnd-1.0.1 | 1 
                  physfs-3.0.1 | 1 
                  prboom-2.5.0 | 1 
              wireshark-2.2.10 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/8f7af43245701d5f78473aa6b69306d6977e911b |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/dc6e75b6c9de3f448bab9ad883fe896fba001a1f |     
    mips64el |               dovecot-2.2.33.2 | NOK | http://autobuild.buildroot.net/results/eb82c9a430ceb4f8c84e508996523fc4ffd39621 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/7f993404edec11c21c5697f5af4d7e12db4976f2 |     
      xtensa |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c964923d63ca79887d29789f189d5afc3e18666d |     
       sparc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/358285224e0e0f2e9bef933ab1c74f17b374e42b |     
        or1k |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/9639712d662f0da90451d832b92cab67b60091f0 |     
       nios2 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/956455db1b3333241ea17321e87aa447739450a1 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/3cc2bc4bc59bafa99844c47da3cb38b3b4c0d1a3 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/317ece2163223136e06d169aa242ee541f0d8aa3 |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/41f2a73b620294ccd89c5f9678a0b6122ffa06e4 |     
        m68k |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/b790370cf20f7c339a0f7ea285ca781991cbf4f3 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0f5ae0871e9c3d3c5d23f30484d20a0c4578bf64 |     
        i586 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/098edf2f8e205acfe3c0bcb7db630881ce2792d4 |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/23ecd13c71ebbc07147a2d9932b3f811c81fb31b |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c32e3dd5ab9fdda682841044e2fa7a0fab2b9894 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0cd81881d21682c3d6c10923ac6bd878b739b695 |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/d3c0c196e972168657cd4440da67ce54ad865e2d |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/ab3c2fb4601a14006e449a8278dbbda30d368899 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f092c6692ee9700768bde415b57116615069dd3b |     
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4f294525834cc6cea71a60f85d57e49e0fc9875f |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/14971a15990f2cc7b063d4960f7f47d20059bacd |     
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/d3103f5b0bd64cf7580d95e8c0f409d96374fe16 |     
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e85404d019fe5e7731b189ca98a6406d4995d885 |     
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/86e058fd9d6e549ef71be68f91bdf967d2babeef |     
      xtensa |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/a16a4651b74477a2a962598294dab3319722eea0 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/54068328134398e091409f58f9231b50b1f4649d |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/6675d72aacb9c3171dbf72c2cd494175a08382b7 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/26b0fcc917672a4c7d9c9edbf2fe5de816553e5f | ORPH
     aarch64 |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/d8eb98950ee108be9f6910b1450cd27d98d0948d |     
      xtensa |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/85e3977c9a9bd7b78189fcd1d0a4721d67b5bd02 |     
         arc |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/5312708df116d4be0d2c5642efa08ff17445b0ad |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/ec80fc96bd49f6c5e48a2ced871baa4b5fee9416 |     
microblazeel |                   prboom-2.5.0 | TIM | http://autobuild.buildroot.net/results/36ed1f13b62b61fddf99d073189864c14be66f3f |     
     aarch64 |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/62cf9e260d1f86b8f898c6bddd9b628d3f9c633c | ORPH

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

             host-gauche-0.9.5 | 1 
make[1]: *** wait: No child... | 1 
               turbolua-v2.1.0 | 1 


Detail of failures
------------------

     powerpc |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/38991fb5009142d2773faecaedd3153d16fd4aac |     
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b3a7163a53e2246866e49fb0e003afaa0c04caf0 |     
         arm |                turbolua-v2.1.0 | NOK | http://autobuild.buildroot.net/results/d042d031544aafa7ce89c74e3e404253b2ee4eb5 |     


-- 
http://autobuild.buildroot.net
