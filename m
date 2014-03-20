From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-19
Message-ID: <20140320073010.05EDE1013CD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-19
===============================

        success : 60 
       failures : 40 
       timeouts : 0  
          TOTAL : 100

Classification of failures by reason
====================================

                 mtools-4.0.18 | 12
                   slang-2.2.4 | 10
                     wget-1.15 | 3 
              host-scons-2.3.0 | 2 
             dosfstools-3.0.26 | 1 
              wireshark-1.10.6 | 1 
                 webkit-1.11.5 | 1 
           imagemagick-6.8.8-8 | 1 
                 python3-3.4.0 | 1 
                  weston-1.4.0 | 1 
                elfutils-0.155 | 1 
              liblogging-1.0.2 | 1 
                  libv4l-0.8.9 | 1 
                protobuf-2.4.1 | 1 
                 cairo-1.12.10 | 1 
                 cdrkit-1.1.11 | 1 
                     popt-1.16 | 1 

Detail of failures
===================

       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7635311f5af7d3ccd15a3af2d37418c5d0434354/
      i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0782967ea5e07e0417539d078b9ce98aef14be23/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/25d64093970167130637164210cdb2c1377977cf/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0f35dac549452844569d802cf0801ae6924805de/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a56e110af0a50f423d03957cf5e692f72515e0fd/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a2027716dd15c55c87f69663075180c5fdb4c1c8/
      i686 |            imagemagick-6.8.8-8 | NOK | http://autobuild.buildroot.net/results/6d1df7a016fe64687a805fb78267b6b2b63dd682/
      mips |               liblogging-1.0.2 | NOK | http://autobuild.buildroot.net/results/1a9675f1262359fbda391646f6b14cf49067f035/
      bfin |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/1889955d1e415ec9e669b27e2ee8ce476ae2ec36/
      mips |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/624ed58c5149b1fd0525395dc2479867ae025aec/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/0f0f3904e83075f0dffc7e6f11f8c0cdf13051f5/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/2764d66d821be5ddf1480ae2cfe921dff226b1c0/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/ed0809e548ec21a5c775f53dfac4ed0db094082b/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/33e38bf1c30cc09dbe992dfb95c48997ca860212/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/3d49d56ec9bfd264dd1a844a13944864266b6aab/
      mips |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/3e096c19df4cb55f4956178c9b1cf3bf55357e88/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/3e6b8bed27ecaec1ff46c2862aa778dfcbdcd88b/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/26a13a9ce9784e3ab03d7923533a6dc8d49f8275/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/4e1a44316ea74041408ba859879014c8334739e1/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/311fb18a21ca47eb32595d725ccb392977d57f09/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/481b11147bb05d41fe97456b48cd639474a561b4/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/7d1bf02ceb32bb2bf91623e39ca7c2ab40a10d7d/
      bfin |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/15630f44fa0f161b91d97c4e4ef949aa61a5a0cf/
     avr32 |                  python3-3.4.0 | NOK | http://autobuild.buildroot.net/results/9f7880bbc8884983c7fe847ce8d55ad993a966c4/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1a5f40e8a3455fffb016cbe9bff250c8ce1062dd/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/62ec5cf8c1db08af571713ecba7e3bb8b5ea481a/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/62665ca866328c47f07d3e449c26e63829ed79de/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/47704536a52933b6c4f1b77a55cc4c7b8de3846a/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/688f4a8ec1ac381c94fcdfe4082e58ee1b0a3c3b/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/2b3c535ff4a80eca7da4dbc22a3059d342f3f532/
   powerpc |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1b351f36eb00dec8c4a6f065ac2c88b0d0ac30e7/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/b3f46c0aea715ddb892a91036309dc4bf2fe0247/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/29105c2bc79156a4db1916dd2c86c96006215f54/
    xtensa |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/30008242eaa3f9bc41b69b335a554b51cf49970a/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6d8f8ac19e8846fb31123566cdd7f1039922f37f/
    x86_64 |                   weston-1.4.0 | NOK | http://autobuild.buildroot.net/results/7f85682ba70dc87106f65962a6e5fea3ab7bfb25/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/b79a4b665c6faeb96b33b7c034f5f108a3438ce1/
microblaze |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/1a8f7c3cb8ce1cfdb31f1e872d822353d5f8d3b4/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/2b8b6aba517716e3a484c1783f4949c56eb771c5/
    xtensa |               wireshark-1.10.6 | NOK | http://autobuild.buildroot.net/results/1abecf91530d25c597ea7b6047b225f8a4022f91/


-- 
http://autobuild.buildroot.net
