From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-22
Message-ID: <20130923063005.12CD652C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-22
===============================

        success : 26 
       failures : 28 
       timeouts : 0  
          TOTAL : 54 

Classification of failures by reason
====================================

           python-pyzmq-13.1.0 | 4 
    trace-cmd-trace-cmd-v2.2.1 | 4 
      host-gcc-initial-4.8-arc | 3 
               binutils-2.21.1 | 2 
make: *** [/home/test/test/... | 1 
                 libevas-1.7.7 | 1 
                     apr-1.4.6 | 1 
                 libnspr-4.9.6 | 1 
                  civetweb-1.3 | 1 
               qt5script-5.0.2 | 1 
                valgrind-3.8.1 | 1 
                 libpfm4-4.3.0 | 1 
                     git-1.8.3 | 1 
                directfb-1.6.3 | 1 
make: *** [/home/test/test/... | 1 
                      qt-4.8.5 | 1 
                 dropwatch-1.4 | 1 
                  libnl-3.2.21 | 1 
make: *** [/home/test/test/... | 1 

Detail of failures
===================

       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/e996e5a2a92e23e20347592b5840ad1a1c24bef3/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/974e16f49362e6a1237224004dc69c6b34f29f4f/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/d33e13f563b9ea445d5c3ad8a42ae0ae198afe70/
       arm |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/426257cdc37fb58fb29af5a3c9e854136b4cec73/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b0b55ddba3c3d419a31adbe884a6633f20ab2cbd/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/979c6d3e4066de5c2d807b01445c9839d4778c41/
    xtensa |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/1bffaff8db0cca155389128e0009fee2ccef11b7/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/2210b3bef49cd9284928f84c7436cf0f95f2d9dc/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/b1d3a6fab9758790ed98e1862692c8d2a479ef5d/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/2444a327349eaa95699a9307855fc2f4d144ba9e/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/bd93c6beaea48e8ecd9cad518652cfce85f5d6a8/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/d6edd1616273456e20ad40686b613c994e7f6f0a/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d2a430ed99b750fb09801d83e0958fdd1b99a015/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/9d36fe540e3441bc6a1d95be9df6c2463c1c6886/
    mipsel | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/94ae25f07d18b22d61b0dc0b94b67efe69b3a85d/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/092f7fa62e222683d8506cb66080687c085a6bbf/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/adce18afaa78061a6301a605005e92f8dff61f55/
  mips64el |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/dfb63dc8fccdbf80dcdc44d7731c8187bcc71747/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/2303e3a72f0ed4c48d24c2c5ececf50b1395dca0/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/e575a68c01d26eb114a4af95e4b722e3602666c0/
    mipsel |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/c9f3c664ea4f73373eba8505d14a96e54dcd67c4/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e8a2e3a1f58811b0764b97108ead0b60c80c8cfc/
   aarch64 |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/6626f65003efd598e4e45d7892a006cf0ceff16d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/251dfae007a2852d7e53b70374cefaea4dfe2d87/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5282a58cec2feba50a07b185d81b26515d3b46f2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/147e62e77c8e5e2ea860315f483a5b214f190e6a/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d772503ddec69e02c5598bf3af4ef543622eaae6/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/e6d9f3ffe87a7d19adf6c7d7ecf9a41db3e49096/


-- 
http://autobuild.buildroot.net
