From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-21
Message-ID: <20150422063016.A6C1F101762@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-21
===============================

        success : 204
       failures : 43 
       timeouts : 3  
          TOTAL : 250

Classification of failures by reason
====================================

libubox-5a0bbefc8fa44044625... | 9 
                  dhcpcd-6.8.1 | 4 
                     vlc-2.2.0 | 4 
            python-pyqt-4.11.3 | 3 
                 rsyslog-8.9.0 | 2 
                   zmqpp-3.2.0 | 2 
                      qt-4.8.6 | 2 
                elfutils-0.161 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                 qt5base-5.4.1 | 2 
               linux-pam-1.1.8 | 2 
                 clapack-3.2.1 | 1 
                 lcdproc-0.5.7 | 1 
              xapp_xeyes-1.1.1 | 1 
                 cdrkit-1.1.11 | 1 
                   perl-5.20.2 | 1 
                  boost-1.57.0 | 1 
                     gdb-7.8.2 | 1 
                   rsync-3.1.1 | 1 
                libtirpc-0.2.4 | 1 
         lua-periphery-1.0.4-1 | 1 
        perl-http-message-6.06 | 1 
                 leveldb-v1.18 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1063e7565665d6d9ba84d2fd50311f40e2a20b0d/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/d1ada42e5c849b5e9c529dfb9eb8794fe4a1daef/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/c99a1bd075d0f2bc48715a9b95997757f2a7f119/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/723db53e3608c72dc0c58e27d5103a04838208f6/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/def9391205cbc18b3f977a75bebf8629c2d86af8/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b7568cbc67eb1ddf0477ac2cad45b6997b97c8ab/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/99bdf572174fbc31a34ab316de06729363200371/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/4083a0ca957f2f990a475e2b2e89393bff7a69ca/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/a610eda66b5f14a325f6ebbe36479035ed0e9d30/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/fcfdf214e45397c9f9b59056ec22d8d09990191f/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/36642af736cf95eb898d3655c720d02b62c4c264/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/8e91458df0facedc56b40ac1f1ee3fb0f9af7200/
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/199bd87556783cda17ecd5fa59afb61d610aca5f/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/f95b0fe1a0562f94ba30058210b17c82d9e5f3cf/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/2c8b0098ccd902f7e2b2f2a2962e22be03713fd3/
      x86_64 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/fa2bb53ffd44e5e285a9988f867a4fb47d81ba04/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/d02cec896e366ea9558b1848b8827babd3c76abc/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/9700b1f1a05daa5d03c39e51b4924ef094aba4fc/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/95b77efb23a72cd297da7aaabe87ea4f7f6559ae/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c42dc09353ba4f8b90e4935665b386933ea90fb7/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/934f15100fe5abc79b905d6393b50ab424f31b9b/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/ce83ab25ca62b30a4dc16aa23b8a43c67b049041/
      x86_64 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/38ed54cd419a2af715e3110fca8c80ba4e845dbe/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/24d4f9bf6e972076dc1b269be1193f037e21d5e2/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/85b77d6b3ab2723d0329fe6dce27bf982e7a822e/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/48fece4393046e574629e1c6d852ae64d91cd818/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/000e2e829fb79381e250c56bc665feab667cf04a/
     powerpc |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/60f4e03455507708a3e163e331853f7cec3043ee/
      x86_64 |         perl-http-message-6.06 | TIM | http://autobuild.buildroot.net/results/860b4cd491b231e82fdb37e09d983c591df606da/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/1352d5b49c7f115719be3971094bddf633b29a98/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/5a88322eba4fe7c97d96ff9223b1ac82b22c225b/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/8f8a4b1c952019df819cf5146cecfea2d89b3ae9/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8c1e18a181f355ab8870c5d3d70cf9d757b6f225/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/38c6c6571a3767b8790f5c5b01dcdc08fd5255ee/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/f41a951f66660372b0931b230b69970a68eac768/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/55ee923bde9f69f7189679f661700767ec4cd889/
    mips64el |                    rsync-3.1.1 | TIM | http://autobuild.buildroot.net/results/beef28b4bca7521cc0147da4deedfd8e8ccd6842/
         sh4 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/c179d65bd8810935d8a0c3bb7d973314ac6d7df0/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d5cc68d113da05b40e152a1cee2d682ce3ef69b4/
     powerpc |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/ee9d0f2ccbfaeccc1e2a8e9cefe76e538175d4c0/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/795744533dbf7076e88163fb35327da8c42819f1/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b6b66e0b24d985462ca8dbefedd740453ca42293/
      x86_64 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/9309576bd3f76975ebfcd6b5cbd609f276056503/
    mips64el |               xapp_xeyes-1.1.1 | NOK | http://autobuild.buildroot.net/results/baeded072fbec4a398738e00dbf851d756af660f/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/f9c9c38ca3b0093221fc54cc54e36e99245a2b98/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/def036396ab4ba2b693b8c6cc740ab0870bb0f73/


-- 
http://autobuild.buildroot.net
