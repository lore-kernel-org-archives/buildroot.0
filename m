From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-20
Message-ID: <20180521060016.68B4A2078B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  39 |   4 |   0 |  43 |
      master | 269 |  26 |   2 | 297 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   libnss-3.33 | 2 
             host-nasm-2.13.02 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

      x86_64 |              host-nasm-2.13.02 | NOK | http://autobuild.buildroot.net/results/a26221a1d7f205e8cf3724e380519bc3e3d44fd3 | ORPH
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/963ef4c6b8b57262441fac2a5bc97595d5ba164e |     
      mipsel |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/0c089a6c6a7217b308f9a3482f4302d43a491ff5 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d3fe986953d165790fa86001889b73aa5f5f5004 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 5 
                    quota-4.01 | 4 
                  samba4-4.8.1 | 3 
                      qt-4.8.7 | 2 
                qt5base-5.10.1 | 2 
                         boost | 1 
               log4cplus-2.0.0 | 1 
openvmtools-5a9033ddfa95786... | 1 
                     php-7.2.5 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
            qt5location-5.10.1 | 1 
                    tekui-1.12 | 1 
                       unknown | 1 
               upmpdcli-1.2.16 | 1 
              wireshark-2.2.14 | 1 
                  zeromq-4.2.5 | 1 
                     znc-1.7.0 | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/bbfb255fa775b46d384764599b4ce4053c0dfeb6 |     
microblazeel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/2082beceb4e6e3bbdb69a96c546d37b91eaff1c2 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/378f7e112ceee381b3a0fa9387b3719ff25932c8 |     
     aarch64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/e2361ee9146ab7ff87a1b49da194a750068c03e8 |     
        mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/d36e04192a55eac686e45399116be7e530ba522c |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/61e8022a21e1dae38a51ca5df28303ec602257d1 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/d8c0d24483e897ddb619854c680963eca07597b8 |     
      x86_64 | openvmtools-5a9033ddfa95786... | NOK | http://autobuild.buildroot.net/results/ee1a64a3f724c23a015668eca6bd26dc354b5a3f |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/4ee8ea7f35ba9be2103af8946847618dec8a328c | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/51ecf04dfe8c74803b44a5dc8b3d5793fa592df9 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/efeb2aae2a9121aa6568c2af9e272408dac819c1 | ORPH
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/f29fa8ef055fe0d41db5944974272530d02ecd29 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/45061be6bbdcdaed71ff459f35174d0e369368e9 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2f0421b73a788d08f0ef966a1149b328f92abd0c |     
      mipsel |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/d7505378dd1644aa3d91795a12137b9dafa39465 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cb0c7c4041ed8102ccceb56f3bdc6e6f0a12b934 |     
     sparc64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/90a144f4e0dddf0bc4f219cac08e3324fc1d59d1 |     
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c918bb60928d73ee1f8d0f481f679368d6e0311a |     
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0a44e8b3dfe0938a61aca8f01d29602e9dadb9ed |     
     powerpc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/fc76155ce2c00efe11b5c86e573a056d89f5275e |     
    mips64el |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/98e4f7a22a0c0c80a078179d8397e30919508f48 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/03f99586296b45fc6d690ddd325c16d515647c82 |     
      x86_64 |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/01d1d511b17767b2421f010552b4e14afe4ae6eb |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/eb245f809b0584e2c97c40b34ba5c229987e6407 |     
         arm |                upmpdcli-1.2.16 | NOK | http://autobuild.buildroot.net/results/43e24b22a77f616d6198c10435dcc23cc3b9088a |     
      x86_64 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/e4fe5f1965194d866e4ad16dade9f2476a28cc3d | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b8fc060e4d626fef1f0f0768dba0358dac02ff15 |     
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/cc56c7dbee594056288296398772ef9e22846299 |     


-- 
http://autobuild.buildroot.net
