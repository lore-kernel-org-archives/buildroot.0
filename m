From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-21
Message-ID: <20140322073009.55D90101563@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-21
===============================

        success : 49 
       failures : 45 
       timeouts : 0  
          TOTAL : 94 

Classification of failures by reason
====================================

                 mtools-4.0.18 | 11
                     wget-1.15 | 7 
                   slang-2.2.4 | 7 
                 cairo-1.12.10 | 2 
                    crda-1.1.3 | 2 
                coreutils-8.21 | 1 
                directfb-1.6.3 | 1 
                cifs-utils-6.3 | 1 
              host-scons-2.3.0 | 1 
                  samba4-4.1.6 | 1 
           heirloom-mailx-12.5 | 1 
                    php-5.5.10 | 1 
                  gnupg-1.4.16 | 1 
                  python-2.7.6 | 1 
                      qt-4.8.5 | 1 
                 host-gdb-6.6a | 1 
                  mysql-5.1.73 | 1 
jack2-37976441044d69b91d61d... | 1 
                     monit-5.7 | 1 
         qt5connectivity-5.2.1 | 1 
               audiofile-0.3.6 | 1 

Detail of failures
===================

    mipsel |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/70977d083b628e226e1b607f025c3ac2832d9ead/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f6f6d1d7918f152aad31c7dbda6ee5a3233b8d86/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b5f8da4a0be50f1421879d15ca838204732780ab/
    mipsel |                 cifs-utils-6.3 | NOK | http://autobuild.buildroot.net/results/bb00db98477f0f81c95ac1830ef3649b30963416/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/426bd737ba33bd0f899d77ccac6daf5854dc2a07/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f9490ea084328f16c9ad8e7b849527396aaad478/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/2f0f273a32db45c4745b6bf8230b62a7ad08bdd4/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/82f6eb3641902bf4e80045e77c6866af3c27e057/
       arc |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/cab7bf43e1d1f04d348cc939bc9615e385d62207/
       arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/d291a8f46e3affdfec0a320d582714e25fc6da71/
      bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/928a3053f8f1f20d8b6eaaee568c23708422443c/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/5a81418681fc6974771db6df0a909a3be41b3e81/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/6951227449f621cb97b2748537a932171eacb594/
      bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/663c9d92529587be23c453c98c71bbe681c4617c/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/20cfb38aefc28e5440fb2c66570959bc6c2306e3/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/8eed672ab5cf92cef03cff8751a27904871b8ac0/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/7412acf0061c2080bcb4b20c53a4289bff193991/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/72d1addd571453e89e104c72e670de0f1f992bf7/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/989fda32172ef9bcaf9ca7e574c17e114fa1640a/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/5df66266ffac90b6107b75315823ec8878053b99/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/c00b2a7b0bc7b4c8a5542cae073d017cf66eb7ed/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/c18e7da16121417e597a153ce7dc2a3b64ece3b0/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/17505c7cf67b1d907cf2cb3dc3f087554d04a897/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/7bf76f12e162dfe34cb93eb8a7b5096733a8da5d/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/d1b221ff0b62134aad84dc79f5c5c8cef75e924b/
    x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/66d72656319c01c5d61b4a4eebc9aef5a74a0555/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/fafe6d178fa2c116eeeca180af7476e41365b9c4/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/35a16a2c6ae7b636e2d52b7ec0a8d5b89349f56b/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/6741431bf50fe936b2af5204d748110d4ab72f42/
       arm |          qt5connectivity-5.2.1 | NOK | http://autobuild.buildroot.net/results/e77e43a23e9f806bdaa85e6c1e3bf995f27f6ae0/
    x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/29830047cf94baebe06f3a801bcfe7e880697d9b/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/e67303b237ece69ff96f88a41f9a6a2af7cd00d9/
    x86_64 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/172bb0aadbc2a2c3e37008de1c609d39f801b595/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/451a9b94ffa238e2b8c2e0ef0c9195fb7f95b39f/
    xtensa |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/11e897277502668efaee82e5164299795c53b8c3/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/9e2d3354442ad9d7b9806b74813ab40c6a0e216c/
      i686 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/aec01ef25501a8f305d2327d41dc64c8399f36f7/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/ee60ffdaeb0bccc93e3eee068635e6544c05709c/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/8deeafb60ca3faeb25f042a03bbd49a39c0307cf/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e3af0ac57f2dd561b36fc079d7996a33574065fc/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/89f16f18c52ee2487fbc76b7cc8270980e3c1b30/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/23b7105d7c433dc60fe3171a38e46ea03ee51545/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/2ee09db63be48ef14a148b644b12c97de7ff2324/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/678eb1ae46b05619d2385388ec6a0844fdf9f0e2/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3e41df70a880c36dc314638a184fbdf3a4747cbe/


-- 
http://autobuild.buildroot.net
