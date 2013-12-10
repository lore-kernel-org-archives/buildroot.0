From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-09
Message-ID: <20131210073007.6A2C4100850@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-09
===============================

        success : 79 
       failures : 33 
       timeouts : 3  
          TOTAL : 115

Classification of failures by reason
====================================

gpsd-327a3ef7c83c1b3b2cf7cd... | 15
                  thrift-0.9.1 | 3 
                  nettle-2.7.1 | 3 
                     m4-1.4.17 | 2 
                       unknown | 2 
                 binutils-2.21 | 2 
ne10-88c18f02199947b2c8b577... | 1 
                 cairo-1.12.10 | 1 
                  gnupg-1.4.15 | 1 
             util-linux-2.23.2 | 1 
for sbin in chat pppd pppdu... | 1 
                      icu-51.2 | 1 
             fontconfig-2.11.0 | 1 
               alsa-lib-1.0.26 | 1 
          openpgm-5.1.118~dfsg | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a628a845c3d583af8d8715055706d6c7774264af/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/cf86cd8659d726ab60e4870305994eb77517aee0/
microblaze |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/310362096b6388a456d06008a24688ec6d5a0b86/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6d63cc368eed17cc7975b4191e79225e9c9f1b6a/
      bfin |              fontconfig-2.11.0 | NOK | http://autobuild.buildroot.net/results/7fd09848b690f65e08f38feb886f6fb4aa7af121/
       arm | for sbin in chat pppd pppdu... | TIM | http://autobuild.buildroot.net/results/92fd929550ed46ef2bfae3a02534a58203162072/
       arm |                   gnupg-1.4.15 | NOK | http://autobuild.buildroot.net/results/b217dccad97e1b3545d3154a9fac6c432d957282/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/7b15ac3d7df56787c480a6e8c5f7772ee73de8dc/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/377b1f19b5520c732eefaa56ff0cc6c39ae2aafe/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/f1c62b0172cff0f5eeac0f982639738c364c8617/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/6d0c85fd590f39b78a0da5a51f0024318bd85a39/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/2ebbf2d9c2ec2c2a58a7eb86e71726fe6787a897/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/4de77a6eecdd9fd2d5291b103bb6fee68fad6209/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/b3814cfc952b0f92ab6f6cdefde7e4166b350a96/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/f71054f523b1bbd25f4f9289da36df9248f97cb0/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/272bca4ccc337a872d60bde8b217b430375f45ba/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/69a986209d7137aa16c9e9ec872cd326096cdcf7/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/93c5bb8f89a2d7edd6adcf0fad7ddd797bdd9ca5/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/b513195084fb8d9aab0ef3339683c319482788f8/
       sh4 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/54f0a7d8a58650cab6f3f3ec74b3d0f0a74f2fc4/
   aarch64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/c24b91a58b675a89dca1ffc77e33438bb1db2db7/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/5081677dee9f61f5a37be8a54b734ce080bd2341/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b050cc669fa7aa0bcb670781be3360ce9d99ab5c/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/0b9b3bb1791bbc9f902a23360c4540d90a0e05ca/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ffda6f3f64c612da999229226f699c01ccebe4c2/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/d6942aac52b49ff413970c5bbef7bbb102950ae7/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/46e01c397e01df40f1731df2e91e3a77695bdf87/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4069d500d3505fe96d5504e86023f3396bad894e/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5a31c8394e37e0e6f81c784b32d407398f1eed22/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/487ba340801a52a836bd32013e0480fe3526b1a8/
   powerpc |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/dd7cc5f55fe45ed0c0e28439faedb8f5b6d5db22/
      mips |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/84f1aeb531df75d3272dab5c27626f3b7701fd84/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/bc971ed2c17168c6c0ecfaf73632f6ba44678965/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/05a8a5bf77c2f89afe5f3786dc3e3646691bb9b6/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/8ba83a01a90113d879fed8272cb9869d7dcc92af/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/94159156b5235154b107aae5848b7ce05ef993b0/


-- 
http://autobuild.buildroot.net
