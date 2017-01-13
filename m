From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jan 2017 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-12
Message-ID: <20170113073005.79AA8207C0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-12
================================

      successes : 154
       failures : 39 
       timeouts : 1  
          TOTAL : 194

Classification of failures by reason
====================================

               sdl2_ttf-2.0.14 | 12
                      mpd-0.20 | 4 
                  fbterm-1.7.0 | 3 
                 libnss-3.27.2 | 2 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
               domoticz-3.5877 | 1 
             expect-2014-05-02 | 1 
             host-nodejs-6.9.4 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
               libepoxy-v1.3.1 | 1 
make[2]: *** [.obj/debug-sh... | 1 
                    mosh-1.2.6 | 1 
            netsniff-ng-v0.6.2 | 1 
                 openssh-7.4p1 | 1 
               openswan-2.6.46 | 1 
               pulseview-0.3.0 | 1 
        riemann-c-client-1.9.1 | 1 
                     vlc-2.2.4 | 1 
                 weston-1.12.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/be3194836d31e9a091a296c10de855f609e6bda4
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ef5b74e43e5c860b1bdc7b3ba2b572b943fd7b44
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/3133a04b5b0148e6c3ad3ec79881929ddf71ebfe
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/2a4239c936df4dcac83315a61217f04631b1cf35
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/5c8ae3fe8b08fc5d617e825de25b4eafc7a00225
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/c93ff74e03687ff6a31f891b0f537d1482f426e4
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/c1af3e5b959ec79b09b9cb76635f312deefc488b
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d5811b5c6b23e9ddade0bfca994e6737d562fbdc
        i686 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/57d6987a4f08e96b15e9fc6c3c8f5981590741a1
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/361f5e70c653824029499e30ad01d68e382a22ee
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8cf8785dd6172d8f78c1d94a682e764d54e0d3c2
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/05481d8370882a2743a467eb826daa0adf422dff
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/dd26f416c4959c41616f9f18c255c9e1785ef181
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/1144240f27c8eaebe7314b4fd93f068c22ca1cd9
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/a264f1628d804bb22730a4e53f27cf89f338d158
    mips64el | make[2]: *** [.obj/debug-sh... | TIM | http://autobuild.buildroot.net/results/5ac31e4c618ea5bbd7c548375554ac2d58ba0204
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/027e6e710dcb75a72584f8f767ddae9c1638a16e
      xtensa |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/0b68772cca8dba42fafd70bc82bb427ad570d2f9
      x86_64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/8dfb84fdc5815deae43effebe297aa5000cc9c53
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/b4828a5f8e973e8755da453efdb9b47c40ca80b4
      mipsel |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/b5ec59f999bd2daec3e75428c3edd5c5741aa0d2
      x86_64 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/44216734f379b242834a9438f02bd7aaeffc2f09
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/2f4e6379c22621ba8f8d627380be38b53912f564
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/37d0b4866a25d6ceabec2beb43f85aabd02eaa3a
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/f513bd20044fdfb3c93a3d039e723c69f6850ec6
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/f3c39d99e03dff4b5effd3a68dec88ffc257639e
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/230fd18e77ca6cd9de4b7467967ca920094efb6c
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/65bb55e40f159aebc2c6cfa49069b82b50c9c855
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/01c42fcc778cf581587740aaeb64d6fbab74ec7c
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/03c38fea721c7418de874fd97313fdf9a7ba9549
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/76f7436b37171f6ac509a5e224b09cd0594c5d85
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba0c628fa3db231d71cb19e13199668aa4993ef5
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6ee85ae60d19dab53a9de555e880a45336302f1d
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bc70cdbf380de6cd756846278bfa76ce6dc4edfb
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1dd99cefc5b0dc3af4d63c300442cfc39c192bd4
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1ee1bd5287d5253b4f40a248d8c74ec597f62ea4
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7ced97ffc3e22222f2b4d95974a015e15f789ec1
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/31588a6b5f86743d73a1f7d235daff658f83ad8f
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/144bb73017c146939f8aae4003cbf646d321dea3
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/2dea0a1b82c535fded6fd67a69496d70e6bcca56

-- 
http://autobuild.buildroot.net
