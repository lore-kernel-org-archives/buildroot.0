From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Sep 2017 08:30:54 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-01
Message-ID: <20170902063054.C839521D61@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-01
================================

      successes : 181
       failures : 9  
       timeouts : 1  
          TOTAL : 191

Classification of failures by reason
====================================

                  cc-tool-0.26 | 1 
gmrender-resurrect-33600ab6... | 1 
                libressl-2.5.5 | 1 
             lttng-tools-2.9.5 | 1 
make: *** [/home/peko/autob... | 1 
                    mpv-0.25.0 | 1 
                poppler-0.55.0 | 1 
                       unknown | 1 
          usb_modeswitch-2.5.0 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b214126d68ef574bc520795d693044d9f5e7d6b3 |     
        or1k | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/91406861f0d726756630be166be69bf892adf277 |     
        m68k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/1e592f809bbf08714404c147c3baf0968dacfd8c |     
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/4aef36977f039a1533b409a7c172f0ceaa2c6088 |     
microblazeel | make: *** [/home/peko/autob... | TIM | http://autobuild.buildroot.net/results/a51b51a804ebe8366d976f451a43a5676ec45054 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/38c158008ad91cf8b8232caba57ad77b8fa0bae0 |     
    mips64el |                 poppler-0.55.0 | NOK | http://autobuild.buildroot.net/results/fa0d7926c13bf503fbf30c507f50efaea000255a |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/af5da1c8ee23d1523a1d810584dcbc84b7a9d657 |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/4d51cabcdd397e3a18fd4af3a7cde044ebd21dd5 | ORPH
       nios2 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/b3d2b4a88a32ef4df8121a58aa647fb2fd13905f |     

-- 
http://autobuild.buildroot.net
