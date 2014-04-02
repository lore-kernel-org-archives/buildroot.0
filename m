From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Apr 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-01
Message-ID: <20140402063008.E322D101A61@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-01
===============================

        success : 59 
       failures : 39 
       timeouts : 0  
          TOTAL : 98 

Classification of failures by reason
====================================

            lttng-libust-2.4.0 | 10
libuci-262fede3e8c8c08c1eb0... | 7 
                     wget-1.15 | 5 
             lttng-tools-2.4.0 | 3 
              host-scons-2.3.0 | 2 
                    mpd-0.18.9 | 2 
                 qt5base-5.2.1 | 1 
                cifs-utils-6.3 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 cairo-1.12.10 | 1 
          enlightenment-0.17.3 | 1 
                   eudev-1.5.2 | 1 
                    gpm-1.20.7 | 1 
                   ptpd2-2.3.0 | 1 
libubox-bbd846ec2d72b262975... | 1 
                  samba4-4.1.6 | 1 

Detail of failures
===================

       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d1c4669b546646503fb67eb035e07acb95102497/
       arc |                 cifs-utils-6.3 | NOK | http://autobuild.buildroot.net/results/023df5c0583c2bc93541f65ac03164ec0fd040f5/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/946b13e6db337c0bf378f11ca738b622232cd4ef/
   powerpc |                    eudev-1.5.2 | NOK | http://autobuild.buildroot.net/results/0605f279abfdfc837f6973f2898ed7ee39f2b8d1/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/77891b2cdf3ee906e4ca9a115a4e177a11f2c0c7/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/48650738b0cc8c12a690f79d6c65079b3a5a3b84/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/070939be1482ebd895d06fed1367712117ca61fb/
      bfin | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/17f83ec849d7a9591fa75be03eb739c3b95cf4ef/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/b8790cbc04ba0a868bf225dbb9957a8301043f9e/
    x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/39946c04677e0ac4336cc2e51b5daec9269276f5/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/603280a71bc7d2b653d4f1333d7ed61c5cf48f31/
      i686 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/9f89dd9851168ec538d5f40d83d5c97104e86f96/
      i686 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/0bf1e1a08bc53520b5f8c21abc7020f95e4f6841/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/bee2b1e52704b1f8eaf89b31185c18167c7d5236/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/ce604dad7ae5f6bd424b6c8f8d3e2b020e31b494/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/b8ff9d79cdf198a763c9f82b56b896f782c71586/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/b74c9941d53db771d481a7f6a57bbc6d8f176e17/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/02b38a16faff35359ab0f4a5707370c47101061f/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/0f3d20afcc13fabbca5755b10d0a79ca6823f936/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/6d1d1d1a8d2a8d8871135b1a92a96c2b07c3de43/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/adb54a8edcd9f4ca6173cdc8ea7a8acd9cdef501/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/7c215f8495a7184ad5997b3672847330b17c2e1c/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/bb81b090b9ebc25e104ca2547299afcf4c2f15e9/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/39d5f1cb21f71ee0518ab12da4e7a4bd7867f54f/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/5f3f47ac95f1375d57cb8a42eedf5563ff3b7621/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/bc73442645023e57c456bc2324e2789ed86c44cf/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/60040ed65c0a104c665967cf8fb7302510ca5476/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/2562ab6360f28653db124ecc73a31ccfcedf441a/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/6f2bd4f75201cb4113d8efe5731b639268310afe/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/b6bed3ac5d6ba07d3f26b65f4694fda9ee0712ce/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/801e5c1491a5f0d6070030f275f9e80e03e54644/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/5c3a92a3e11bb3127a020447f1bd030e1db51a9b/
    x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/07772102ea513d5a5baa09ad7a6d14e49a246e79/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/8b7d0c5db590236bf1ab9e5d138b7f76899b8736/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/0d7e2409ffadc4ae6d7690ff786277f1535ff223/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/89356654a4f51da4bb432533285a171038c927dd/
  mips64el |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e0c2fb640bf3d04d04f8e26893b408996b3d92d1/
       sh4 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/d0c39de64553d95bd8b8e18a677fe7e65a74fdd4/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/eee4c328797e694b0b6094a48759d24d9f0b05f8/


-- 
http://autobuild.buildroot.net
