From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Mar 2017 08:28:54 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-23
Message-ID: <20170324072854.E00C0207E4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-23
================================

      successes : 110
       failures : 22 
       timeouts : 0  
          TOTAL : 132

Classification of failures by reason
====================================

                  ntp-4.2.8p10 | 7 
                poppler-0.53.0 | 2 
               upmpdcli-1.2.12 | 2 
             bluez5_utils-5.44 | 1 
                  boost-1.63.0 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
              leptonica-1.74.1 | 1 
                libepoxy-1.4.1 | 1 
               qt5webkit-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  trinity-v1.6 | 1 
           uboot-tools-2017.03 | 1 
                     xen-4.7.1 | 1 
                 xorriso-1.4.2 | 1 


Detail of failures
===================

         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/873416b04c245db7e60bcb59d0293fb2c626203e |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/070cce2d52462353a27d47a194132f4f6a5b0168 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/ec3ec3a5c2788f8327764ce7efd486a548168147 |     
    mips64el |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/0cd74312a39e3bc59d15789a4c0a891f0f417b8c |     
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/e5685e1ff07a761ef056e7652c0f1b455a94b491 |     
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/da149412821ae9d4e1aad396980f1fb76b6eab41 | ORPH
        or1k |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/6d5faa3843170f74c28bac8dcd155f83be021c18 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/1d58bd8745b22c8eb71fea4c7255d3ace69f6f7a | ORPH
        or1k |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/a62f21b7bb2ec81a0b90c7f79ed4b9ef7bff8335 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/1c3812aa714a9ad18aee85cdaf6321fe8d8852d7 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/f4af8e58232882cb76d386cf44cce9a507cd647c | ORPH
     powerpc |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/8c6a3cfe0bfb07d658a51a5a0a6c93e1a554a1a5 | ORPH
        i686 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/c0b77b2b51fac310309a6420f098c1b103e96231 |     
         arm |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/13aedea327557de49e685528ba6a27a74cad5de9 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/2972b527986da1bb43ed431221730e13f59abb8a |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0d877e4c59a59ac5cee98f301c84b706dab86bb0 |     
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2855073c64fdf920f713e78b6af740c27627e768 |     
        i586 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/62843f7e167d69d64847f2e9f70f6ec68a821bc2 | ORPH
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/01683da6321e85defaf55350559982bba4ec81d9 |     
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/6c74db6c474fbd53a0da0a2fa5eeba9c35b900fe |     
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/0c4f6c67ca0e74fc9c6b92a3b8aaa4e5c1d3c9b9 |     
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/ba1e2bff8b48accc3c0828de75f686b15ec00bb3 |     

-- 
http://autobuild.buildroot.net
