From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Nov 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-27
Message-ID: <20141128073010.C02491017B8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-27
===============================

        success : 203
       failures : 13 
       timeouts : 2  
          TOTAL : 218

Classification of failures by reason
====================================

                    fltk-1.3.2 | 2 
                minidlna-1.1.4 | 2 
             alsa-utils-1.0.28 | 1 
                  perl-gd-2.53 | 1 
            btrfs-progs-3.17.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 mpg123-1.21.0 | 1 
checking if snprintf needs ... | 1 
freerdp-440916eae2e07463912... | 1 
                   perl-5.20.1 | 1 
                     vlc-2.1.5 | 1 
            host-heimdal-1.5.3 | 1 

Detail of failures
===================

         arc |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/7f6150a06e9bc526dd318e9526f8b126114d9291/
         sh4 |             btrfs-progs-3.17.1 | NOK | http://autobuild.buildroot.net/results/9f182cd5955d724750135bcd6cb7e315fb28334f/
     powerpc | checking if snprintf needs ... | TIM | http://autobuild.buildroot.net/results/1be786a90a3fa349be9b665c6e306a6b8835d98b/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9bc82aa8c687f8f8744d7cc53204c5ea7af1e015/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/ae6c4be9d7e0644224a9076c91b0e2d7119dc820/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b60591fc6ba3fff3c3fccc91368430a81b0e0271/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/62570f69e9f75b74040887c064edfb72e438a96b/
     powerpc |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/9c333cb5345a2f3365df427d90cce3ff819271ab/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/79cbae4dab3ad712bc20c752fdd91e168eade9fe/
      x86_64 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/6bd8c009056beb67092abd6d18064500302dcecb/
       nios2 |                  mpg123-1.21.0 | NOK | http://autobuild.buildroot.net/results/437f408122d7f21420a7cdc9758caf0ab1ba877d/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/c0854e49720ce1934daebaf7d85d55383dd0a959/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e74efded899744d757cb798c44f096b54898f95a/
         arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/ee3fbed47a69446f1907690cf0a8dccbf9717f84/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/91ddd6b131bb26f5c2d3cdf0a33fbe470b4e632c/


-- 
http://autobuild.buildroot.net
