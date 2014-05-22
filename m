From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 May 2014 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-21
Message-ID: <20140522063007.32669100E75@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-21
===============================

        success : 84 
       failures : 25 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

package/luajit/luajit.mk:67... | 14
             dosfstools-3.0.26 | 2 
package/rpi-userland/rpi-us... | 1 
              xapp_xedit-1.2.0 | 1 
                  ffmpeg-1.2.5 | 1 
                  python-2.7.6 | 1 
               audiofile-0.3.6 | 1 
              gst1-libav-1.2.4 | 1 
package/rpi-userland/rpi-us... | 1 
                  libv4l-0.8.9 | 1 
                gptfdisk-0.8.6 | 1 

Detail of failures
===================

     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/39ab2f631be6a4d901f223e5ddeb80a2841bf1a1/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/bd7b0a24f4408e45229dc785fa0c491427c8de73/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/fd08b223ac9892d514d5f704c336de53b5623a9a/
      bfin |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/aed5a257689a183eab589ea483f6e09dee3cfde7/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/02da4d170cf9f1920dd20161c69e825654da4cf7/
     avr32 |               gst1-libav-1.2.4 | NOK | http://autobuild.buildroot.net/results/a960c47eef7b0af92f646e5ed6140e860220f399/
      bfin |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/989d32f3532283817e9439aa78cceff5983dc421/
       arm | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/798aa01d93755e164de8b0acae590c1ce42141f3/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/41130e5be69e206177ca9154ea3d373eed8bae75/
       arm | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/8d717c3b71de64102d386156d2c018e33af74c44/
       arm | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/41bbdfa3f4ff9e9b7a4fb9c3f35db026b7847d6e/
       arm | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/5ce4edbb4394c01af97aa8b2ca9b40ec2e673833/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/8a7cb8123e6b936e3a82b946f027a79f8e0a50cf/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/f69dad530a80df0c215cac658362d430f3317b09/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/b0382e0ebe65d38f6f08be1977b550fbe8f39ae5/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/f7aaa67664dd288fd6554a1e7bc5a028eaadf4b4/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/513d9fab85fef9d80b263fe0533e9b7dc0a68321/
       arm | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/a306d3aa92db2d7b572e31abab7ef2969e268aa3/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/1c5ef3148eeffe978a6c3210d0372fa9cb8542ff/
   powerpc | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/e823a64e14084b85b7a548528afc20603de94a8c/
      i686 | package/luajit/luajit.mk:67... | NOK | http://autobuild.buildroot.net/results/c4f9a92cf065a358b364e8be007f20901695a276/
       arm | package/rpi-userland/rpi-us... | NOK | http://autobuild.buildroot.net/results/51e8e521c4abaff022489c7a3fc2c65f8717f11c/
       arm | package/rpi-userland/rpi-us... | NOK | http://autobuild.buildroot.net/results/55a65bce70a74f79d75d95843d0102d9741af326/
       arm |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/07ecff868795e7e0d95d01187344d1bbd6f51760/
     avr32 |               xapp_xedit-1.2.0 | NOK | http://autobuild.buildroot.net/results/659411fb4eaa73b6061e315ca345c18716613831/


-- 
http://autobuild.buildroot.net
