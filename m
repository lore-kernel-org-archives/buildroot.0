From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-27
Message-ID: <20180528060018.25E1420717@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   1 |   0 |  32 |
      master | 234 |  20 |   4 | 258 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 


Detail of failures
------------------

        mips |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/02b434c90628854366aa096d72207fafadefc658 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 6 
                    quota-4.01 | 3 
                  samba4-4.8.1 | 3 
                         boost | 2 
               log4cplus-2.0.0 | 2 
                       unknown | 2 
                  dash-0.5.9.1 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    links-2.14 | 1 
            qt5location-5.10.1 | 1 
             qt5location-5.6.3 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

       sparc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6daa317171fcd8e3f55f5703f2e34343da1ae316 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b0cd02644e8515af6808490d9a06e40f31a0ab2a |     
       sparc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c69977fe8c1c6934a27d9af52fc211c391bf035a |     
       nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/bbfa3c25c5839339b21f1421bf58a522dcd5598b |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/8dbbe089cc1961881d2fb4d4bfe50fa0bb1b1f2e |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/98df32d226c33204cec98534d76874af6e85a6fa |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/50ac48572163d416a00941ebe0be89b740ec8dc5 |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/16fcc4358f333fcdb40329912423b873f199d8e3 |     
     powerpc |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/7934c815a3009af688c2f1183e67dfe542c9a009 | ORPH
      x86_64 |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/1f79f57d17804c5975ded09da8ba9f8fe19bb770 | ORPH
         arm |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/13ce734c61954ba893ad3778df11677a2a3f7ded | ORPH
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/d0cdd60b81ad6ea93f9cd90aa1bce33ed60999ba |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/964ae75b1a46b123f4d393579632b1bcacb78572 |     
     powerpc |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/69321c87e5df3af0099bb5215305fc951e06a0c4 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/028847dc1fddb8c3416b52f32b88ab1672d0a64d |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f3fe1e7406fa8011771f0273d4bd7a2a5864bcf0 |     
       sparc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/34a1eb05f2fb21a535c09822225df532d4fc6417 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9087c3ea30e924cd523b40f78f45db5f6e8ddb46 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/2f7b1fa578b5782720b05ce03d4a60e58b38fcee |     
      mipsel |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/413f5d7cdc84237766b35ac1c843e42f75941950 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/92f99e8aabbdcd237cf299b8dd9a37c1d955f3e0 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/5ee4cacea4deb623a089b30197824d40e54b0ac0 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/b6d927dcc73ac8d754422577dacefff4ff918a5c |     
         arc |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/b3a97d79b9fdeff1b8954ad60a7efc4658462fcd | ORPH


-- 
http://autobuild.buildroot.net
