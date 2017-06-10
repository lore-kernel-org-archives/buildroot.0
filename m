From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 08:27:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-09
Message-ID: <20170610062719.D9CC621DC3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-09
================================

      successes : 185
       failures : 51 
       timeouts : 0  
          TOTAL : 236

Classification of failures by reason
====================================

                     gdbm-1.13 | 14
                 lcdproc-0.5.7 | 10
                  cppcms-1.0.5 | 6 
           host-doxygen-1.8.13 | 4 
                     php-7.1.5 | 3 
                 sngrep-v1.4.3 | 3 
                beecrypt-4.2.1 | 2 
               qt5webkit-5.8.0 | 2 
                  ffmpeg-3.3.2 | 1 
                   glm-0.9.8.4 | 1 
            libpwquality-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                 qt5base-5.6.2 | 1 
             qt5location-5.6.2 | 1 
              webkitgtk-2.12.5 | 1 


Detail of failures
===================

         sh4 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/86042d4e650b5ffc95039bbcd9f64a760d2f0cab | ORPH
       nios2 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f482b03688b5f763d4973df67bb11565b9ba2d0a | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8b79d921f0ba6dfe10dcf4c549ee2be401aa7aff | ORPH
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c5fd7b274b8f767ba7728cf56fb63be1626a6994 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/22ad309066cc2b500833e9a0d9567e5dd0666b9a | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5a2db553f24f03669a5dbd0a2bba567128495d6d | ORPH
 powerpc64le |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f8a6bfb7458ebc6dd3deb3145f074fff1e6c2095 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/17629016dea3be7df730cb36bf85320ce1e9b4ce | ORPH
       sparc |                   ffmpeg-3.3.2 | NOK | http://autobuild.buildroot.net/results/9b3ea8e545555b4561b19966a4d45fb8ee8f3501 |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/1a8032ea743bea017336cced8c789fd637294b20 |     
        i686 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/8784de50b6ed61668976b64ee9847ad7458ea113 |     
    mips64el |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/7007c2320722c695a6d8843ad6b444a3f7aa80d7 |     
      mipsel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c6a7454248a747774501d27021df2a21d2d6a3f1 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9714c4efb5218a7136e2ecad88d60b7053c220e4 |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/615820e7517d92ea2b4dfd8b32162ca979ced192 |     
        i686 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/f3c9a2bdc2864ebdd8351538150380453e48b0b9 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/98dca1193a376482bbfbc3930726d239b9092fc4 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/b843c44a5f843f8cce21e4baffb95260a2d8d8fb |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/86b638d814c266cc5e691ecb6def45d071a3a9d3 |     
        i686 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/63793827d6d9bcdadc787faa5a4556a9dab39ae3 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/81b8c07d6f33bb99784dd5f17a6f16815c4c730d |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/085060cb796f3aa23d3b1432f3456ab104a341e5 |     
        or1k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/2f67797b50dd84624d7455d2d31902c778eeaa28 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/b8e7fa9a2e2078521651a0744e7009f80aa413e6 | ORPH
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/cc010ba7bdf301936fdf9a7319930020903a7e54 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/5d881b81819ac4e76ab6123e662ec75831b37002 |     
         sh4 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/3f305fd4c455d05dabb00fe3144d814c7aefd586 |     
        or1k |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/1f163a88ec6881c84708265bb48aa34278a747f0 |     
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b9011e94125953c426a4745235a5b2b86aaeffb0 | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/84945a1eaa47b1cbe5c36cbfadf61386c10ba40b | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/85015fb7ef6605da3d365aaeefe351be56340a9e | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/8a106e8d31ed1f9f667190630edd98ee4e175bb9 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/6a39a17fff05ec9d1af761c5c30393f38d5b71bb | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/36ea0dd825f13dc5da0131ec4ed926528f021d04 | ORPH
      mipsel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/5caaf01ddef7f8a45181707d0933a9e810787ee2 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d03504625af6f4631ed1a8d4784e9a7f973ce6b6 | ORPH
   powerpc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d3daba3cabcb28d11b0755c9dd82d97429d7ba2f | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/dafa0dbe819842b3ea534491601aaf46f8e8ca2f | ORPH
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/9925050a200835114103844ba388037c61af95e4 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/eca04870fe2c8f1cf948424203096fb4cbd17a7a |     
         arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/a74db7c80befc33ed9b49e3110ac4ae88dc437cd | ORPH
    mips64el |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/0bd9dda7c5bd1fad8b0aa3fc031a1b416a042dfe | ORPH
       nios2 |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/cf12696e2e9fbfba0391d722ba7830d5efcfbb10 | ORPH
      mipsel |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/2ab9315b211200f6e1fe767ff3bf96e152d87b12 |     
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/7b026fe6e118a9283cf2017f2cb6e879a90e1512 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/64589d4228bef205172a6fe6ce8958ebe692ff49 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/df818485dd9bb637f5c8b4b63e7d79ef0d171086 |     
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/aed8e2018414ed06af219245f1596415e6d21d59 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/4d27afe28de86c4c637c62db1c27a69223e87cca |     
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/9fcc14af46922f8e188dd2b6231ef0946bb64b97 |     
    mips64el |               webkitgtk-2.12.5 | NOK | http://autobuild.buildroot.net/results/145cf15bbc54a5e579a86e0bc1f75fd8683c7d16 |     

-- 
http://autobuild.buildroot.net
