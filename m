From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Mar 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-04
Message-ID: <20140305073008.3DAFE101B04@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-04
===============================

        success : 77 
       failures : 33 
       timeouts : 1  
          TOTAL : 111

Classification of failures by reason
====================================

                    libsoc-0.6 | 4 
                 cairo-1.12.10 | 3 
czmq-b5730c5f8290a611fd3b92... | 3 
                     eudev-1.3 | 3 
        gst1-plugins-bad-1.2.3 | 3 
                  zeromq-3.2.4 | 2 
                     php-5.5.9 | 2 
                     wget-1.15 | 2 
         host-python3-3.4.0rc1 | 2 
              host-scons-2.3.0 | 2 
               audiofile-0.3.6 | 1 
                 dmalloc-5.4.3 | 1 
<command-line>:0:0: note: t... | 1 
                  samba4-4.1.5 | 1 
                 lvm2-2.02.103 | 1 
                  connman-1.21 | 1 
             libxmlrpc-1.25.26 | 1 
                 mplayer-1.1.1 | 1 

Detail of failures
===================

    x86_64 | <command-line>:0:0: note: t... | TIM | http://autobuild.buildroot.net/results/82e7f26e2e307aeb66a8ff98be3369e04886d226/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ee48919bb9d0651642b3a1b547cfbd2c5ef2a8dd/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f1735664c37a72b1b8b137f8bbc6be14624c84e9/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/77f4cb65535033db9d5184b142d96f2a508a7a5c/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/da19c46398ba8a0977058d76fe21bd9968f92ac1/
    x86_64 |                   connman-1.21 | NOK | http://autobuild.buildroot.net/results/5c500167a7277fd3f3cdf02e13749f6e98a0e81e/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/99363a20dc25600460bd4cf169d92c922f55a5f6/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/48ca7dbd47d4231b6b98f490f952533caf888861/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/cc9eafd42f1d7887763b912b2ad785635201be3c/
microblaze |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/d8b4f69e5b19a3d9c1b8e4114e686cff7cfeae2f/
       arm |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/5190f23b84ca9eec49f1071ccfdb3314f6c4ae5b/
   powerpc |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/624ad8ef30318bfb2de0952c5101cfa2b8d94f76/
    mipsel |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/c4e920b16c57e79df979f00cceaea7c0483f043c/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/ac98e35736532c697e1c08e23e1d6800c951ea23/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/51ea53c39e6c067760c2d1e9c0c7b7bfbbe28be8/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/4dab2c72b9583df03db5b065a7f8a7ca0e6d9181/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/ced5ed9ce2f1742560828999eeb6dc8777729d78/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a423aa18e25686474633d6420bf701e1fa637bd0/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2eb4783dcc3fd990d37f34f2a146a7c025647bec/
       sh4 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/
      i686 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/6735751b31dfe8e3ced80c5d18d816772286d4f7/
       arm |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/578032aac810d04cced1e8fdf0f6f39d20132de8/
      i686 |                     libsoc-0.6 | NOK | http://autobuild.buildroot.net/results/1888956c040f56b4d6603f2d2f44ccb7614a87de/
      sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/31a4ba00f9628365f080877079ba8d8120f4f23a/
       arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9a259663b28ae47ed2bfd15f53b0fc44b5853227/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/c505587a795cd936ce8d5dda4805c0974a96981e/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/59ade0d9290cf623b45cd6fe0d0d56f295588ee0/
       arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/8505e0dd5ecda76071f0ea4f7705a105308a1c20/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3abe178c26dc34a4f6a887ed3abbfcaa8990ce6d/
       sh4 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/a685caa6d3e4850a45360dfe733013ba2d53404c/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/047f2f8ac15592d5f78093249eeed14148de4e5e/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7a0be4da26415b05f3d1c9522da703be408bb5f6/


-- 
http://autobuild.buildroot.net
