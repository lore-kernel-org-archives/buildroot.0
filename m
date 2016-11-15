From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-14
Message-ID: <20161115073014.66BE520BFA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-14
================================

      successes : 223
       failures : 59 
       timeouts : 0  
          TOTAL : 282

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 10
                 mesa3d-13.0.0 | 4 
             berkeleydb-5.3.28 | 3 
                    mpv-0.20.0 | 3 
openblas-f04af36ad0e85b64f1... | 3 
host-gdb-6be65fb56ea6694a92... | 2 
kvm-unit-tests-5731572b2ac2... | 2 
                 libraw-0.17.1 | 2 
                    mpfr-3.1.5 | 2 
                privoxy-3.0.26 | 2 
                  autossh-1.4e | 1 
                  boost-1.61.0 | 1 
          chocolate-doom-2.2.1 | 1 
                  gauche-0.9.4 | 1 
                     gpsd-3.16 | 1 
                  guile-2.0.13 | 1 
                 jack2-v1.9.10 | 1 
              libarchive-3.2.1 | 1 
                 libnss-3.27.1 | 1 
                 libv4l-1.10.1 | 1 
        lttng-babeltrace-1.4.0 | 1 
                minidlna-1.1.5 | 1 
                   mpd-0.19.19 | 1 
                 mplayer-1.3.0 | 1 
                 openssh-7.3p1 | 1 
                    php-7.0.12 | 1 
python-libconfig-b271c3d9da... | 1 
qt5webkit-b35917bcb44d7f200... | 1 
             rabbitmq-c-v0.8.0 | 1 
                  stella-4.7.2 | 1 
                 synergy-1.3.1 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
                 uclibc-1.0.19 | 1 
                 xenomai-2.6.4 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

      xtensa |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/96807eda8a4b5a25225a82d7dd2b352b84fc3ddf
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3b4882beddfaebe29c6138efbf3d745fa5f3b430
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0bfb58668db4f5b4b593b733edd0610f821b0fef
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c3b968f219900d2994b68ec7103e0e9a1746534c
     powerpc |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9fb605ffb6311dfd7b7a23dee6a49824cf2bef9d
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/d4504871bd47930e8363032d380cdfcc5bb8aee7
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/aa0d7312b4ec830229420fdf324dfa77157e7d10
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/ece9563e1d442d09bf279d534624d8e5914dc86e
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/811d077c1d407d1a925786c11b616b122b95dcbc
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9079dad3f138c313a6abb40825baf4d9683a2422
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ae9042bbdb01847e3855d64cf586324bfb9417dd
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d5a0508810a8c2193f1fdfeb496e105b9fc6bd79
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/ef14c5ad2aaf1757f50782df2cdbf86de891172c
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3129b67878df5fcd274c0bb3eace3b860fd5b642
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ebe16b55722929205d4177a67de7b559c65ad2d9
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/22e9eae6b910c605e5f86d5916feb39156b78c43
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/77118e439b237c5e10575d2f784e64b3ea2f8ad7
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/22ce473b6c94f2d91a252d844e560f813ee1435b
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/30851683d5d6e340713f703f5f4f1ae4c89ee346
      mipsel |         lttng-babeltrace-1.4.0 | NOK | http://autobuild.buildroot.net/results/2126796574654bb2f9e3af0079b6aa7cc9651af0
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/f780ccf076ad441c1fe506d7e6a63b8141b2ab3e
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/46c6d014bb834b5731a59eac2f73de95358438c6
        i686 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/69052db60ba8b2ca473dcf0373c787bfc3731471
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/4c77f33c842b37bf28cb931edf1b290e1bf4d93c
 powerpc64le |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/5d60bccbe024db240630845e15a3f15e8ddf0f01
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/14b36a3a7c6f6bc2267fe87fc36648a6c30d4149
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/194a0e9bc8b5f1b77e4f51874f4552e3bbc54012
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/5d4222ee5f4075695e8b0a5aa4506454c9d0a59b
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/361a0d757d9896e525b48a9800e155227550ef42
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0ba4dbfd2df44ea5d64dd4a9ab0f553e8465a9a2
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/974798dde50b8d08d2dfde005a67e0f3532ed59b
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/66daf3f804c8016ec527fffbb10093d8e7f9f6a9
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5b834eaad703094a2412119a58136186071ac8fe
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/1e69efa0b4198a39c18bad030bac4ebf6c491138
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/d5dc5b3550a4f5f5084e552a256f47bb916e81c6
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/4f4ea1f10e275e8bf1b1b7eaad1e70f194ec0868
       sparc |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/35754e918ef49f00942e2f90228a9c36b3393c06
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/a6391c3e2b65021c6b815113bc7ff39916ab68d3
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/902729a0b98675ad803939e3ecdcf230065a6012
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/fd061f0a6fb549cfa87181c71678ec1cf5da4cb0
        i686 | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/fee570b697b84a11beb7c05e00c4aa8dbbbb6786
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/1341c604695fa39bcf71593749f8f5c7aa2f7072
   powerpc64 |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/ec1bc57675b6e53af0cd33d7b99cd2e3bf5d9d7e
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/0fcc08e4ed6947348235fd9684c625a9a9d1f011
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/82f4fe76bbe6353815615e31296c5c45460c65d8
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/e5be24a64bd90b96ea9f79658aba9a3865eab05e
        i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/01e87c17f6c181561fe60c99b500d644f7af4a5c
     aarch64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/4022adce015fe93a7e82e61f9193348e35870b32
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e1dcf91ba1c588e616031966582935db9bdc3518
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/c5bbb8c47f51cbb79ccf421e22eba78126d30fad
      mipsel | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/848d860ed8b130d983f57a2fcacb3dedaeeac2d7
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/72184ea9dbc50a0d743fc37c97cedd7a5d6ca142
     aarch64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/2d18214415621e022deb8ee4ec262a6a004488b3
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d551dc8a7bb872ee707e0924e890ba398697f12c
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/1a7d756ee0e748f53327f44a78add18b209d80e2
         sh4 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/1ae8bee297edb089535a2fb6ec724ebf7976888d
      xtensa |                  uclibc-1.0.19 | NOK | http://autobuild.buildroot.net/results/3149810897536c8b4aa01855f296123b9f32438f
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/7657e9469b338e6e8f7269271bf89a57e16c0cc2
         arm |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/7f0fed97f00b95f87940125c2f4b4c636d94a9f4

-- 
http://autobuild.buildroot.net
