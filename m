From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-10
Message-ID: <20140311073009.B8EB7100EA7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-10
===============================

        success : 69 
       failures : 35 
       timeouts : 0  
          TOTAL : 104

Classification of failures by reason
====================================

jack2-37976441044d69b91d61d... | 7 
                     wget-1.15 | 4 
                    crda-1.1.3 | 3 
                     php-5.5.9 | 2 
                 qt5base-5.2.1 | 2 
czmq-b5730c5f8290a611fd3b92... | 2 
           heirloom-mailx-12.5 | 2 
                    mpd-0.18.7 | 2 
              host-scons-2.3.0 | 2 
                  tstools-1_11 | 1 
              gst1-libav-1.2.3 | 1 
         host-python3-3.4.0rc1 | 1 
                 cairo-1.12.10 | 1 
             libxmlrpc-1.25.26 | 1 
                  python-2.7.6 | 1 
             util-linux-2.23.2 | 1 
                    gpm-1.20.7 | 1 
               audiofile-0.3.6 | 1 

Detail of failures
===================

    mipsel |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b377d69b07497969a504cfbc55302c1303315aa0/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/bf8af061d7414b2c91709cf6fc2587b71c827523/
   aarch64 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/d39bd8b2e79e1a52ef3756c0aac30c6716611295/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/79451040ebc9e98baf09b21c8ddd881aec9c4d45/
    x86_64 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/09738d829185415e95be1ba190b2e394a8ea1a2e/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/def8aeb53a940852720283bb3bd04bab262a1157/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/a5ede3735dce1d5a641c2021488a2954ebfce332/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d875f93b524dcd6c5ae8c5643052c03d1a243a46/
     avr32 |               gst1-libav-1.2.3 | NOK | http://autobuild.buildroot.net/results/40470aff5f9772e9a8cba23671b8afb812dceabb/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/4cb60a8fd870358c640c2157a6d52067be6f666f/
       arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/3c495c0b5a8d6fb55ac922f4129cad7bba4a0a98/
       arm |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/ef7e472803cb576a64040971d7c926dd296d47f2/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/614d5bc62137a5a1a33bc3ff7f60ee8794559b94/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/920011c62e27183d139326910c6331079defcfcb/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/3308f0f8a0a7deb07bc2d962d671c33bf2fac847/
       sh4 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/198b2aa84cadb2a51f376b274f84c438fe7b045f/
  mips64el | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/24475de8a909649c900bde36a419fcac39bab6bc/
    x86_64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/74db7ee141fc8be4479b811947f035ac7276b943/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/2f1ae484e202ec56800071d036a6f65d2f1cee19/
  mips64el | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/1a7732e23ea6316660da34b0c842116d86afdf8b/
      i686 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/eab9386aa60dec891a5af641a72d306fdfad4d5c/
       arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/81ea576d219aaee2bf1a2a5e2d23f0b66a7be6e8/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/bc5cc1750450d585221d04bfd55523cf8fa5ec95/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/39bbcecc22773bfb234eddfdbb34c92681b4ec31/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/301f14478a269e86d4592ede90ceff253dd0cc54/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/99dc0a3a5796f3de9568a8113b5df29529c3fa2c/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/b27f9ecdd8aafb81283a52b7fd128d0debcd1fb9/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/59370ab9e63719f8c451d680864dacad2742e689/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/fae272665c647adb46872a14720ecee8b8ea6bdd/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/1780d67556c605f2606c053e864bb72a2355bac8/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/baaf4b987da1a1a475f5f1680e167f0069e8875b/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/ac79df38cf1bc9a8a14a6b4657150a0624d0deee/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/10a95409519c7b4d05a90616ac32327f19fd2a40/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e85de5462131a680e7d3254bdfd58134ca8b39ba/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/40935a96775f7f5def90f333e31e42e836b8d1f5/


-- 
http://autobuild.buildroot.net
