From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  7 Apr 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-06
Message-ID: <20180407060014.442812075D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  38 |   2 |   0 |  40 |
      master | 186 |  54 |   0 | 240 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.17.9 | 2 


Detail of failures
------------------

         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/ee49869583c69a91e724816d315ea6a8ccdda65d |     
        mips |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/0ed4e7253c51077eea6a19761d5ff4ea927904dc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 14
               libglib2-2.56.0 | 6 
                  host-go-1.10 | 5 
                   flann-1.9.1 | 3 
                    liblo-0.29 | 3 
                    llvm-5.0.1 | 3 
   python-yieldfrom-legal-info | 3 
             bluez5_utils-5.49 | 2 
package/python-yieldfrom/py... | 2 
                      qt-4.8.7 | 2 
          usb_modeswitch-2.5.2 | 2 
    azure-iot-sdk-c-2018-03-16 | 1 
                  boost-1.66.0 | 1 
             expect-2014-05-02 | 1 
           libfreeimage-3.17.0 | 1 
              lynx-2.8.9dev.16 | 1 
                     php-7.2.4 | 1 
                   picocom-3.1 | 1 
                snort-2.9.11.1 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

         arm |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/1bcd8eeed1d3c7f9e202fb0cd69c2f8e10faea0b |     
         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/b343d8a679eb926ea57f1f84f2ea2f2f26999392 |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e65675740310b3dc409e2b106c15fd2aedeaeced |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3334325352492bf438866ca63768c670f825d5d0 |     
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/75c8e730a429efe2c24325d56c60f56de8c9daa7 | ORPH
     sparc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/443b52e6a917ae75a47e566f714cfe52f6325ac2 |     
        i686 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/6e6d85a792b39eaa323ca900d9ed49041b4919f4 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/c4d61b2952e6973b1ee1344d7555196cb790e8e3 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/0cd77e3e329272e7a82ffbbb7f57940ec05adf52 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e8761bd1c924beda851cf1b967b626a1abff1abe | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d58ba033a6f542563cfa2966f3f54ad6ca9ce718 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c878efd344b227ac46ac20043ad8e176fab7e846 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e69efdbb09957211cac587085d8cf8e336166240 | ORPH
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a1ada6e01b8a4c95c17acf0c82cc9b9e840067ff |     
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/a3c1f0af7dc00989ca8e8bd6f2aec2cc3c889299 | ORPH
    mips64el |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/26fbd6a40dc5fda7a4f3551ee037fa6385fa7eff | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/33bafcf2d4005875f6b606d32665faa9c5d4c2d3 | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/32c70baecbfadf36d5934933abb8643ee592dbe1 | ORPH
       sparc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/b9dc286e52daeb99f5fe6738e157dc1bd1858c5c | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/71e0848a310095689fbac52a6f5acda9bb37e57f | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9c17ef09d317d3120fcc6c0cb26e8e6496746f0b | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/afa3444546741d8218477fdb05a8986727ca71be | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/d5ddde4565d9c9470c77282b5c05c41a9426c380 | ORPH
         arm |                     llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/aa8a007056fa983dbc9e8c144d9f44c89fcb3980 |     
         arm |                     llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/ada497f6a8d20fa1a9adb2b17a138d7b726a6cdc |     
         arm |                     llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/216d32b602a7d6c484b596ea01bd1b5287b88825 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3fbfed16b0a4beee55a6cd91f94177b5bf408617 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/730176f3327b60c55b8c8700d10b15778a39dff3 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0b923d76ff036e478e06bb482ef33d332f824d93 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8fcaf6ff6c17c382469203d4de412cd7c650a54a |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2d428fe9644af9b7f8bcda13a017bbd66141e0a3 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e9d3ccabf0d664abe2afb13bb79d429bf27b34bd |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/74e227fd953bb76292d3dec7b3db7540a7f926b4 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bad522ab0cd98db88722fbe4e722ff45e16ee94b |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2fc7f753a4ee454581e03b111f62ea9105352577 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7506fc5f4acba9c749bad2be959846499301af45 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ff6a115b8c45b5f0828cd9be876dd43852f32d72 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/08d34654325e5b2d3103546599b7177c9fce8ee3 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d870e60feaa89656fe4b79ad6df2bd15aa5e5f15 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5da98912fb883dc9a011820265f24e87e10e85df |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/b2d0e82e78ce5bdd35070d92ff99dd50a16012b3 |     
         arc | package/python-yieldfrom/py... | NOK | http://autobuild.buildroot.net/results/2ba225e3aecbda5fbf06b37c7288d205464e0c95 |     
microblazeel | package/python-yieldfrom/py... | NOK | http://autobuild.buildroot.net/results/283898a0d912423517a9d58978e3d52fe50fdf96 |     
        bfin |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/909302ebe3259d57c990aa72862bdbb0b18e5221 | ORPH
        i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/3d874d1bc838f69b6411d018065015f851caf1e9 |     
       sparc |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/84da7d2e71a1427cbd5b7ad2efc4bfda0e1d5017 |     
      x86_64 |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/a66f1ed417912fb2a475dc0ef9f054a2c43b840e |     
    mips64el |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/39550723106a04156e1c06372fa193ae2ea6f551 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/99fa5e7ad4c9bffc8fdfcc59fc9c9539fd726ad0 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6093d83078278cd00c8690f1c9d6a283dd6d0c52 | ORPH
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/8da8607c4a0fd4fceb48be30256dcfbcbf6395ea |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/14d3e30d5ee456f904fae397a03fa266c535abe5 |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/c8230c1fdf0c77d001a57f9fc1eaca27e92bb9a0 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/a9b8f1e0ef1b3cf4842a1267871efaaef1982189 | ORPH


-- 
http://autobuild.buildroot.net
