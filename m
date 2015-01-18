From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jan 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-17
Message-ID: <20150118073015.BE760100F55@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-17
===============================

        success : 272
       failures : 26 
       timeouts : 0  
          TOTAL : 298

Classification of failures by reason
====================================

              host-erlang-17.4 | 7 
          sane-backends-1.0.22 | 2 
                     rpm-5.2.0 | 2 
             libselinux-2.1.13 | 2 
               libcap-ng-0.7.4 | 1 
                openssl-1.0.1k | 1 
                     ntp-4.2.8 | 1 
               host-qemu-2.1.2 | 1 
              libarchive-3.1.2 | 1 
             alsa-utils-1.0.28 | 1 
                libsrtp-v1.5.0 | 1 
                  weston-1.6.0 | 1 
                    mpd-0.19.8 | 1 
               sdl_sound-1.0.3 | 1 
                  zeromq-4.0.5 | 1 
               ding-libs-0_4_0 | 1 
       opentyrian-2.1.20130907 | 1 

Detail of failures
===================

      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/330242ff3be7449da20c36eed97de661b4c35d41/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a2fc25aff3a514b2295dd85cc1e286165de65454/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/55afca45d1105cebb56953bf1cdf5063ec5a0a1a/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/29e82a7b4d0a5ed74ef514f8b7a0e83301255acb/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/43d97a7845eff761d02ee8433f401f4d8addc5ed/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3cc4ff2a0dd2242bc94a793c6b24bf0ac8feec5b/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3a2a813cff34c8fd0d95d086db0287e6964c9263/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/325ef3c50fa10c1b2ae24c17c43de5ebabe30d9a/
        i686 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/954ee8a9db5cf3df03652d219a70df80ca1b1f3a/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/d24c6b6b777ec0de56b48b3f353928a76e1fa0ac/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8877f4adce1edfe2d5a4bcdbaa7155da9f3dcc2d/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2be30f374c0413376af4143ea8630f1886deb5c1/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0dcbc7ff9ebf994e1be23a9d2cab2c47c07124a4/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/c94c00b93990a48773b3d7841f513b50134708ce/
         sh4 |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/d5b82170cf7369e370e5a25241ac2db29772f431/
        bfin |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/ab7f5f5bcfd9f191fcdfb8e55a00251b4833588d/
     powerpc |                 openssl-1.0.1k | NOK | http://autobuild.buildroot.net/results/34aa3843cc12ef0b359c7f256b362dcc114abf16/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/feda9f76cdf7992bfc66a37a479b942844d3bb99/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/ac2ac1a439cd9b431a952eaa49d5e9a89801dc1d/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/4899873073cbd2bf46b53b083073d976e0c7071a/
      x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/43798a147e0c64a821d90b4078e6afc6528368b7/
    mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/e746552de737e7e4d0baf0acb27372d96f7644b5/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/3c3f251cdb8b1d181bbd85681a5db0b616bebc5a/
         arm |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/6dd69be8998a5b65791d2f3f5067937b8d93bd2d/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/849fe15685105e38033ec6c102bb5776aebda32a/


-- 
http://autobuild.buildroot.net
