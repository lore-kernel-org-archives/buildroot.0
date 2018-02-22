From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Feb 2018 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-21
Message-ID: <20180222070010.882C22071A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-21
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 172 |  28 |   0 | 200 |
   2017.11.x |  23 |   0 |   0 |  23 |
        next |  32 |  28 |   0 |  60 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 6 
             bluez5_utils-5.48 | 3 
           cups-filters-1.17.9 | 2 
                     php-7.2.2 | 2 
               domoticz-3.8153 | 1 
              dovecot-2.2.33.2 | 1 
               host-efl-1.20.6 | 1 
              host-erlang-20.0 | 1 
          host-libglib2-2.54.2 | 1 
                libcoap-v4.1.2 | 1 
         libcpprestsdk-v2.10.1 | 1 
             libxmlrpc-1.39.12 | 1 
              lynx-2.8.9dev.16 | 1 
                   pcre2-10.30 | 1 
                poppler-0.59.0 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-237 | 1 
tvheadend-e06ffd87beff16103... | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e7ab7c28eae7d4758cae2e833a76ecce57856821 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ff0b801e4c981b487935e53731ede3ab8f1f71aa |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/54d792f71e19a0e796176031bcfad3c44157d9ae |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ffa5f21d7e7c38ea7adebc84f1cc8ee4cff74f1b |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2879576eaa870eecd31af1ff9261df1b86966542 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a89df3195b44f125ba1797cf866f4a266909ec05 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/c947986e4f460c1733c81585302f58baca84f01a |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/679a12c04e9954947dd51df2017af561c362f8ec |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4e901a97ad1c21f21e508eab8268374220f2eba3 |     
      mipsel |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/17fb36642031a67966f30d8914a27bc652e1b449 |     
        or1k |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/783a19e629fd48ac2d004b77934718288ee20dac |     
        m68k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/834f5ce925b352468fd749c53bbe4993b40bdf17 |     
         arc |               dovecot-2.2.33.2 | NOK | http://autobuild.buildroot.net/results/b649545d27f97576bb73668abf57534dd560d110 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/3a4b3ddf0abea23cf5d4d5a38aeccd3b113abd68 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/044546de89891d668cae88f656a58e12f25740ef |     
     sparc64 |           host-libglib2-2.54.2 | NOK | http://autobuild.buildroot.net/results/7ce7e86e27c01286e22285e33e07d2855452badd | ORPH
      mipsel |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/8f40ab3b42a5672361cdce60bf8aed6783fd383d |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/38348d55ab3a3e55748075eac9cb17ec03085422 |     
    mips64el |              libxmlrpc-1.39.12 | NOK | http://autobuild.buildroot.net/results/e42734edca8cfca5badeed9b51fcaa01fc3edaa8 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/bcc1981cba903ef332228dfb1233f7ea8a2e7a01 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/1c33efb9e176ceaf5d8ab52fcbefb4321b330ac0 | ORPH
 powerpc64le |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b0dc799799b77a3e511bec46435f6cde48cf1ce7 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e8ea8c514442ed1ac8048e784a7441380727ea60 | ORPH
        i586 |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/07c92dc5edb041106f652e4ced854bf13f94f75d |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/e7eacd66b399bac8bf0ab126acddff75c2129541 |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/545fb976dc32e18e60d940095cf11645c24f45b6 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/974d4dd0ebd39acf4868ccaec83f1ab81afe9f05 |     
       nios2 |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/9f1e6c9ee71f60fb224cf1df6a26f7241578c5ef | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             libite-legal-info | 7 
              keepalived-1.4.1 | 4 
                  udftools-2.0 | 2 
                  host-go-1.10 | 1 
           host-mono-5.4.0.201 | 1 
                    htop-2.1.0 | 1 
         libcpprestsdk-v2.10.1 | 1 
           libfreeimage-3.17.0 | 1 
                    liblo-0.29 | 1 
               lightning-2.1.0 | 1 
                nftables-0.8.1 | 1 
package/libite/libite.mk:16... | 1 
                     php-7.2.2 | 1 
               postgresql-10.1 | 1 
                  samba4-4.7.4 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-237 | 1 
tvheadend-e06ffd87beff16103... | 1 


Detail of failures
------------------

      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3b913178377cfa14f633013b41387e591092dfe2 | ORPH
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/01def471fbd7b90a3bfd969731b4fee23443623d |     
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/36f84c5b1f29e93ccdcc2e73fd20686479d7a572 | ORPH
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/edad1ffe791b7ae1c79c9f32f9e0f3703d3b1147 |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/78f1b501e6ecc07c64934723599c2f857ddb5396 |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/e241175c69b8dee45ebaff62630fc1146f498c43 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4c436112015859569231a5c4e6a7d4eba584f336 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/752b87b88c369eca442c0221169b65c54597969e |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a5bde552e02af8872431d7e1170773b91db2efbc |     
 powerpc64le |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/ba34f1b14adb508d10e8764b42d107a1c87b5a44 |     
microblazeel |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/f9d2317f4ae30deeb8123860cc4445a3f68fae9e |     
         arm |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/e31413e0e32f34d75a37783a430c706be9dff3c6 |     
   powerpc64 |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/4ac09469fbdcf4cdada8daf3a1ca2a5daa1d1211 |     
         arm |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/6e497fe49d6af95bb1df136572abc92c74a25c55 |     
microblazeel |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/75bd87a986f951f53b8e47db7b36eef72e20882e |     
    mips64el |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/729be4e8d3ae9e92d6d766d442181816202be562 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f56a9fe1f2a630ba6afd657d1f1bb808491cb54a | ORPH
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/29234bb5325b2439b1e64dd19c55c57d8a63da30 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/0aec73de61c0306497d3c8f55b25679961ec667b | ORPH
      x86_64 | package/libite/libite.mk:16... | NOK | http://autobuild.buildroot.net/results/2e9be5c03c9c69b4115d6535c33e14f9675bb11c |     
         sh4 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/283f7744a2fdf55f8cdfe82977262cae8f9529d0 | ORPH
         arm |                postgresql-10.1 | NOK | http://autobuild.buildroot.net/results/b69ab7d8dea794413da9fa079d8e0ccee94229ba |     
         arm |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/1723518afa05acf739bd381df1a5ed973d00fd33 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/c3fe8de4311dbbd1d9fd3b7c03ffbdc95ba61719 |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/658a08386634ffb1e9e41c9db4efc0b7252c642f |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/35ea44e517194b5057a38ffe2e3c78250b824c0b |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/326ebe60df9a09dc26bdad7be846decf98d3be0c |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/82eeefeccb680a30349c82910c25d6a21d25ee2d |     


-- 
http://autobuild.buildroot.net
