From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-25
Message-ID: <20130626063005.373FA52C105@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-25
===============================

        success : 92 
       failures : 47 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 12
               libglib2-2.36.1 | 4 
                 libffi-3.0.13 | 3 
               openswan-2.6.39 | 3 
                   icu-4.8.1.1 | 3 
                 nodejs-0.8.22 | 2 
                    acl-2.2.52 | 2 
                  iozone-3_414 | 1 
               ruby-1.9.3-p429 | 1 
               qt5webkit-5.0.2 | 1 
                  ne10-88c18f0 | 1 
                      gpsd-3.9 | 1 
                 ffmpeg-0.8.12 | 1 
                cegui06-0.6.2b | 1 
                libtirpc-0.2.2 | 1 
                    fbgrab-1.0 | 1 
                   cups-1.3.11 | 1 
                     m4-1.4.16 | 1 
                directfb-1.6.3 | 1 
               aircrack-ng-1.1 | 1 
               libgtk2-2.24.18 | 1 
             gdk-pixbuf-2.28.1 | 1 
                  webkit-1.9.6 | 1 
                  readline-6.2 | 1 
                  connman-1.12 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/132fca7062d221c554e6a5a857b79496cc5880cc/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/abca1da33fab3dd8680746c39a89b4b35e0389f3/
   aarch64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/1efa34924ba4d931b3a7f8d0dbfdf6b4f4d166fc/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/8b9abb0d04ca667bdb9551662c849c70873bceed/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/ac7409492819177fac752cbd707c8ed07b0efdbc/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/b9bb80b8d9efc84ed36bffd8dd5c6f4b7d0b404c/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/bd222d836478ef6b8017ba160cb87c4e923928e9/
      bfin |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/4daabb5eccaa101874487990bc5887458a6209b3/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/e1cbbb2498dc88967df27ab0f11996df42d3f60d/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/268a1e5af561fec6e663cd8ff248327b2a9ec873/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/b0a8b495c31bf2fd1fdd072fa6ddc8b3e1e96d3f/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e85783ce82268fba6525f363c5a7519137c106a3/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/f0d1a4408247051cc9af7746427b7030dc420290/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6111806b41ab7ed1fd4d079fc36e32576d4ce4b4/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/769428d01e0c99ecc7bafc52ed313735f767aef9/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/773a8e2c405cdb1b02e1d163708a254c9ba5f329/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/73b5ab9dd4950709c92040f1c72ceb94a03a1e0b/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/bc92706123584f73842b634ec0cc9ed6a6a62bf3/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/a6ff489e41796986b2c75061ec0291428839fb00/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/7325bdd5b255f17d543783da8c6aac17409b2dda/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e4d96fbc0f83435c9c94cca2ff3cbf5841357a38/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/a492db177a5b9d6f7ef5cabe37f9cedfe01c6cf2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/8d0eeed3e3ed5900432cf8c939a87d7fd0819f73/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/96d6997611b435e17962246492b4d4872e5d63b7/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/c4de1e63fb051212f83522ea0b8fc3f77db37d83/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/f0aa9a8990ecc291d6343d8f166bc85e7e2116db/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/202bac4dfba1357a3a769044a5bd7e22eb287ccc/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6cc3f748d4ade0b54bc60081db7c674afc34e5c1/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8af87d44dbdc6714c1182c61ff8a73a86613d0dc/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f00cd7dd879bef17685d3805c12786666719441f/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/070ddfea717dfbf43d4ebbdc7b0393f0a30af8e6/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ff43c3e1bdfaa1be77d040f4f8078987bb6035c4/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/078d32e9caa1fc3ba8493e79866c7b405a84d6ac/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/8dbe6646170ab0c7c01c78d71648245d36d02aab/
      sh4a |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/8e1902b39dc15a0668c4d9ad876ac2ed8fc0cebb/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/64899d7d6ff0ea0d223734fe910437f8b5b424d0/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3d15d7761936c2be91a1ec5b64fb2d46accca641/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/89b4909bee59a145f50128d58fc3ff4b64f43ac2/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/9921a42969f5e148b0bf70b5d3fdc22bea8b42eb/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/05f24e8a49f6c47b2073da12f6468cf14c4e644c/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/5e1dd7cf06ba558b19c56dabe014044737324823/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/14b38fb00724d3eed35936586a6969e0061f1cbd/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/6f45990e0b187c0da9259453aaac018e35c927e8/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/fc3eaa5b3d7222ea9da15b31bb2cb3836df85ffd/
       arm |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/d78267aad7e286d0d565b969d10cae0b05630553/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/452f2b7c4fa1d19cf289efacb200d11f73f16c4d/
  mips64el |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/2ae8a444dd09385a857d84840ca1149fed746a4b/


-- 
http://autobuild.buildroot.net
