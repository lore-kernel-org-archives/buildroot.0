From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jan 2017 08:29:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-13
Message-ID: <20170114072939.40BB520700@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-13
================================

      successes : 137
       failures : 52 
       timeouts : 0  
          TOTAL : 189

Classification of failures by reason
====================================

                     tslib-1.3 | 8 
                      mpd-0.20 | 6 
               sdl2_ttf-2.0.14 | 5 
                  lcdapi-v0.10 | 3 
                 libnss-3.27.2 | 3 
                collectd-5.7.0 | 2 
             host-nodejs-6.9.4 | 2 
           linux-headers-4.9.3 | 2 
               openswan-2.6.46 | 2 
             rabbitmq-c-v0.8.0 | 2 
                    ruby-2.4.0 | 2 
               tcpreplay-4.1.2 | 2 
             berkeleydb-5.3.28 | 1 
               domoticz-3.5877 | 1 
                  fbterm-1.7.0 | 1 
       gst1-plugins-bad-1.10.2 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                    mosh-1.2.6 | 1 
                 openocd-0.9.0 | 1 
               pulseview-0.3.0 | 1 
        riemann-c-client-1.9.1 | 1 
                     vlc-2.2.4 | 1 
xdriver_xf86-video-openchro... | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b41b754ba8c808f082dd7e9dff9ae522c8c8372e
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f286c192ff254115214e0d0a0c96845c30921117
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9e8a34a79ed0f9c2b08dbdb2ccc98d032d48580c
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/b6d1eed829ba21c25745e0769bd1ec745792976d
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/5d6b6b7c77a3e215e2f29401305083ddcadf44a6
     sparc64 |        gst1-plugins-bad-1.10.2 | NOK | http://autobuild.buildroot.net/results/5d64277694ed44e387db3b651cb1f858065f101c
         arm |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/77675273bcdca7a77e95152a9d9e412f94d92ca2
         arm |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/31892233491a3b2e48ba407a5cb0a5d5d70fa93a
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/f98f5f272f10ab691399d2d6dd0f600e0805c1d6
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/313f2d84c37f030db25a25adb2b9954a3dfb483b
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/d7cb764314b64997559566d86567515e6e24b43d
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/8fb9261461d48cffa7a0dec93d32f5eebda8482d
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/b1972dbd5e41aec2182fb3f357f410a35da8a102
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/1f0b75811fe0139ddff4b6880c599d3fb4d79687
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/c965e009b192eee45694981a39c412e74173ffdf
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/075efb25e0521ec1a055d5a15ec9a80d43def6a5
      xtensa |            linux-headers-4.9.3 | NOK | http://autobuild.buildroot.net/results/fe31f9fc787034cd3c6876b09465f58135e68b0e
         arc |            linux-headers-4.9.3 | NOK | http://autobuild.buildroot.net/results/7c7abd74947ad3bb3791b90be6bd648495f5e93b
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/7b3cc7f2d4394870de98d16d859e7f728af991af
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/da259e57f96cf0dd6fbac9fe44826e93f986d9e9
       sparc |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/242b4cff0257f353ce6b2df744c51488dbc0d2c5
       sparc |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/8d50a025ffcc5b3408fa27f59f0cd896616dc2c6
        i686 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/362233e40960f8f0410bf24404fa05ce38cbfb56
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/a5506440bd02726d6e3b0240ece876c73b92b546
       sparc |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/e964b1f0ac39ec9c14f5e3b368132d8dc671c249
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/b610d311410e1ab2501e913524578a7f686fb0e7
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e2286dd0d2821ce7332b80e6f4aeea2052dbaa9a
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1e193abdad1310605d90681883955ee677e13485
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/41e5c5fc87c2a0f3c4eb03ad479baad461240be6
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f04ce1174e84d7785de2dac4db50f86a07a849ac
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/1a264b4ee3949b8a79d51cb4c1d637ada2f23474
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/2ec45d9140d44b7b558f0ed74ac3f92c0e3f7368
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/8dc508eaa6b5600d568cba49e464e1ee07f37054
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/9986866357e50ce9c95ce8de2ed2e979fdce0f8b
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b0235eef3364751ab9581873d2ff6c0765059802
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1ca8013089cc620ed280820b909b4f2eb308126b
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1cc3376a6217a588c2cbe3d5c8132dbc7e772850
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/96cf23c77932402dc0622112a8a16086f64a5196
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9e9185fb0a8d671b386a3800f42d89da5be64001
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/db18d6a09ff85d6e706135db20c49c0bb73e08b1
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/060078900057c19ab4d2290d4a964cbadee72cfe
       sparc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/4e03083ee855925dd9393f53ab03b97a97c75436
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/8291c237235de8e33d114c6b716001bf5eec4372
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/abf9b07175851a4f10169a7de09226c1ad3406c8
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/3026ed9c57bd701464234a29c5bf4871ad8684bd
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/d990b2d78c5651921f0967038001af8aa0f9cf7c
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/c79de6fdd5cfe406979941790276296b6d1ec0b8
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/4882a8865a1e57e91eebb5aaae18e4099e476a9c
        bfin |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/bbd4575725a3acfe3ea61ce53f48168e25d30897
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/acff77c30fe89e171d7fa2eedafde8079f8a16b1
   powerpc64 | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/89c9641553734495aa7844951dfd25fe0ec0d9f9
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/7abda396272492d21623b50f9a0c79eab4b22d6d

-- 
http://autobuild.buildroot.net
