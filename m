From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Oct 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-18
Message-ID: <20181019060017.3CE2E209DA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   2 |   0 |  22 |
   2018.08.x |  18 |   0 |   0 |  18 |
      master | 168 |   5 |   0 | 173 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/e72d14559be856ca6baaab1eeb83d9f87a6cf524 |     
     aarch64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/e987681f67de775f8153212996164afb02e984e5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
                     mdadm-4.0 | 1 
             util-linux-2.32.1 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/d044e33380cdfd2eb06e8dd9be5bc7c69b64bbcf |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9d01aaed78cec1f9cb5dd5acf3db8ceb16eb6c2e |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/4bdd03b1d8f30ef32177727aae46d8cf54fbc35e | ORPH
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/c60da93bb814f5eecdeba03380441409b559b2ef |     
        i586 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/a7804c82c3a05f3a322658d29857a5b0c7f06ec5 | ORPH


-- 
http://autobuild.buildroot.net
