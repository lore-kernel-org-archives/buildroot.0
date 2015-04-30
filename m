From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-29
Message-ID: <20150430063016.9892A1011B2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-29
===============================

        success : 150
       failures : 76 
       timeouts : 3  
          TOTAL : 229

Classification of failures by reason
====================================

                  dhcpcd-6.8.1 | 29
  toolchain-external-undefined | 7 
freerdp-770c67d340d5f0a7b48... | 4 
                  boost-1.57.0 | 4 
              postgresql-9.4.1 | 3 
libubox-5a0bbefc8fa44044625... | 3 
                libtirpc-0.2.4 | 2 
      host-gdb-arc-2014.12-gdb | 2 
            python-pyqt-4.11.3 | 2 
       gst-plugins-bad-0.10.23 | 2 
           aircrack-ng-1.2-rc1 | 2 
                  fbterm-1.7.0 | 2 
                     php-5.6.8 | 1 
           libfreeimage-3.17.0 | 1 
tvheadend-14f03b8efbc40b840... | 1 
                 dropwatch-1.4 | 1 
             bluez_utils-4.101 | 1 
                host-gdb-7.8.2 | 1 
                   ncurses-5.9 | 1 
                       unknown | 1 
                 lcdproc-0.5.7 | 1 
                 rsyslog-8.9.0 | 1 
               celt051-0.5.1.3 | 1 
               qt5webkit-5.4.1 | 1 
               mongrel2-v1.9.1 | 1 
                  snmppp-3.3.4 | 1 
                 jack2-v1.9.10 | 1 
                    bsdiff-4.3 | 1 
                   ncftp-3.2.5 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/8a3c96ce1c1d3405c7dbe149d3dc814968a144be/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/92b61fc1f3cc3c1b78e25430f57a4a9d0ce5e267/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2ea34e0f2d38c1d6ef996cd65562fc354cb80cfc/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/999dd04e86cc0a55d82d4b8c143726d090be4284/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c90113dfe1c37d4d39c2998a4e5062cc0f7182f2/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/f42fd956bae60af992861bd6566c56c93c10905c/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/f50babb8b35e3c1cf325a8c4a10b290690d616a1/
         arm |                     bsdiff-4.3 | NOK | http://autobuild.buildroot.net/results/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/
         arm |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/223ba6003bdd7e0c896455c21fa8fee943b4e716/
      mipsel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/fef27ac42e5232a0426d1e24cc95b731b5caa5dc/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/abfcc4d60b833df7887acadace45f320e2cdf7cc/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/305b38f6a71567fdd9ba5692bec0b514ae5cee98/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/44537987a5ea0cbe8b196a6468ac41e478cffcd2/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/6062379ed019d14baa29c0d5163962bb97a2078c/
      x86_64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/f435200bc444b80fac412c2c6c19b1e9ba897b4f/
         sh4 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/07bf192c04ed2a506b4200f690afd6bf90782fee/
        i686 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7c0d9fe84865266eb2d281301ca390f55915b2ba/
        mips |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/debc3de5c9ab41798f2dce4efab67738f22b0222/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b72bc4dcb2b04cff5862a5111d5632c15b454072/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/d21ee6d324c5eaacac6e1c26aef6d052d1855d1b/
        i686 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b870d7ffc2189376b2e48a6e37c052dfaed7f806/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/1ea347755c696e2f736ae64f3dfd244baafc0d69/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b9f358469e538ecac120ab60f5eeccd60de94d3a/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/c260bb6613cd59f0d211a29d735084e5e9e10af5/
        i686 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/672b93ee54b9a703108ad65241b510aee2588367/
        mips |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/34ce7c0f624b28c4eb7a25ce5c9f2aef6931338a/
        i686 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/3ade9c67c7ed3eae933a879b8839cd2b3531fb13/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/370d5e5741ceba595be47ea100973de9cf5e0d73/
        i686 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7b71bae6d76caffe7fabc02cb940844dbcd1ef2a/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/47cee6d467a1a0de11960c6236ecec7436310ea8/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/835bdbf04f180ffdf885b399775cd551304b7b18/
        bfin |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/22ef9d1fe9f49ebbd8399f2693a1894097748709/
        sh4a |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b0c6e89a01a3973b86dce6934647011a55a51742/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/cde9a3f6182cc960cf696c94e2292c89a70c05cc/
        sh4a |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/2d1cea6ea92b85af211dccc65d807a57231ad3e2/
    mips64el |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/5abac1eb88b8bf68efb3469c23f6bbac3b5a708d/
        sh4a |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/fd3fdd1e9e749209898a71e6f13dcbd0e8f127e9/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/5cf9ac8c6f29d937e6c8cc5f6567ca56f649b482/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/70f019329fa5af6b573bc3ddd6c0bcdcb5ca8bec/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/8b0e60fd107b2dff7ac7a3902fc78a0ea06dae4b/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/da88f40dfc51aea122c146e5bfee19b031cfaab6/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/09831ad505c90b24606b5e98f55a300ca883b10f/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/159b167d56f403116fbe0698b49ed65bd98e75bd/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/05d157897f27802a76a582622838fc1714560c66/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0f65e275da1434a4439b8e1b962720c0ed7844dc/
        mips |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/5e424a25ee6796207e7a85ecbc80ac4428b0522e/
     powerpc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/3b0e0356549d40edbe1c9a86214437e0f81fb3a3/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/e7ec75c958959efcc6e80e6ee4330d5687054e1f/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/7bf03fa8ec1622a42745f2a86a9700106a3450be/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ed4cd74fc5c124bc112144ef6512347b4e552623/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d2b3e40b1c9afa5ec59a4eb7c1d952b38244229a/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/0410fb15e65561031453bedbc549ed82ce7bdc71/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/96d0fb6bc545b5ed6d4a915b203dc06f8646db6e/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d8632975d3cdd4162dea076f5a798fa3ffe2bb2e/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ab78739a0fbb0d6094bf43b014b4f30ec83c05f2/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/2e5e3712265aa6b54acd90da99ea3a11eda75bb1/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/f5f9ffedec4e137cede733deb9e68928735cea89/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/14c6252c4664554c1967aa8e20b4c8e06434f7f9/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/6ceff23a508db89764dd49e77609c80a2f007d3f/
     powerpc |                    ncftp-3.2.5 | TIM | http://autobuild.buildroot.net/results/e7f0691e84b35350afbf729a92d5ffc853420aa9/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/770bcadde0ff0bd67400ade229965ff2ea7b9b3b/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/604995ecf88e97976cbb9e4257ce85df66934ff3/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/5212c81aff32e19c3dec406199f6ebb73e160b67/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/4d7a3e60299fdde0d794b8f2b05eb3df672d5fdc/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c1158460a9f993fced20f5885ef00d9ad1cb7e2c/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/6ef53f81fde0421cd96302977d563ebc60171037/
      x86_64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/64e311bfe7cf6200df48bd54214386a0ac549cd7/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/5fb31abd2720f5a51e50ba9c2b2c458cbf8c4b57/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/8d98ec2ad420bfcf89fc13ce4675338e5e12a457/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/a9d4964d1f72268a896576120b75b1a97a0f3bc7/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5aecdb8dbafc857741783eb9acaf0bd1a683940f/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c85010b906536369865b925e79def5d85d0be19c/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a59035b889f2fe86f210e86210bbe90edc6acff0/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d74bb368a2117048e3ccc20789ecab0875ea8acb/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/46577791dbb440b6720ecf07c9706b67d0aad9d4/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3b3238ee733ec58a37988e925a8ce27e4fffec79/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0cec387fe2815b81c0827dd0ac8a9156e9042f28/
     aarch64 | tvheadend-14f03b8efbc40b840... | TIM | http://autobuild.buildroot.net/results/dff3c182338c306a50bef513d6d9d4ffd35a1a20/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/85509129c228ab0fb95afc58512aa0460b29e026/


-- 
http://autobuild.buildroot.net
