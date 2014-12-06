From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Dec 2014 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-05
Message-ID: <20141206073013.3C3B4101709@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-05
===============================

        success : 183
       failures : 27 
       timeouts : 4  
          TOTAL : 214

Classification of failures by reason
====================================

                  guile-2.0.11 | 8 
                    exiv2-0.24 | 3 
ltrace-0896ce554f80afdcba81... | 2 
freerdp-440916eae2e07463912... | 1 
                jasper-1.900.1 | 1 
                   nginx-1.6.2 | 1 
                 civetweb-v1.5 | 1 
            lttng-libust-2.5.1 | 1 
           libmemcached-1.0.18 | 1 
                     rpm-5.2.0 | 1 
                 sudo-1.8.10p3 | 1 
             lttng-tools-2.5.2 | 1 
               iptables-1.4.21 | 1 
                  weston-1.6.0 | 1 
               tinyxml-2.6.2_2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
       directfb-examples-1.6.0 | 1 
   100K .......... ........... | 1 
                  thrift-0.9.1 | 1 
                 libnss-3.17.2 | 1 
                minidlna-1.1.4 | 1 

Detail of failures
===================

    mips64el |    100K .......... ........... | TIM | http://autobuild.buildroot.net/results/2107df6761ad181fb1b09aa132e99c7f0f79ebd7/
      mipsel |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/9b5a5f5e1c4331d6ba44a12f66f74d950ee69ada/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/f5e0fcabdcda3b9cff3774efea9eeb871036e510/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/f17b3e13b3a546cf2d6aae63126397e84a1a1641/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/c2dfc56ce9f98f9048c8eae81e4c69374c3e4e02/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/15031e4d070a92880b846c6e9b03184a1e50f59b/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/7058d4e33f11fb7d91428533866522ef85991dd3/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9ca6b25f29df4d560d4a4cd27d450ba2efa5531b/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2c67f4c6b59eadbfebb3d7863911a03b96cd315c/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b64153e2d003e94b6f55994b55df80595081ae96/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6bd733893c3bd66f8aa2587c2c138ebf21f3f8b7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d862e99267815eb5ff3a657ce36d45040ef55af1/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f5371e32e4c126351ddea3dc551c44aa1380d11a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b9102e74743061c2b2dbb597c440629c568ee912/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ce80fc7f034b8a962f1193e2060533bef6e4f067/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/13f203c576513ce66422d3af7ff48b0dbcb93266/
      x86_64 |                 jasper-1.900.1 | TIM | http://autobuild.buildroot.net/results/c1c33ebd61e0e33a345ee9832a6b14ba52fa8715/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7c8fee558132d423a997517e7ad10b3b4ec4e3bb/
         arm |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/2f2ff45fdb40a8f7f4625616d09c84fe8d37b437/
     powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/a3c1647578cdeda3aaf672084a9a893f06dbad26/
      x86_64 | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/1c2f13be84f6ab7a8107b97a548da0b825aa6b7a/
     powerpc |             lttng-libust-2.5.1 | NOK | http://autobuild.buildroot.net/results/eb3c124b87addeec4fc1a7570a595e913ce7bb13/
        i686 |              lttng-tools-2.5.2 | TIM | http://autobuild.buildroot.net/results/c216ecbf7f54316ff22b2365eab64efc2fcbd2a8/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/b3c781a788ab8b99ae143865ecbe1161da66edf9/
         arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/f3e2c7a937517a5444f8c6cc0b02692af897b3e0/
         arc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/2e36d715917f934e6c4d9ab825525f9ad4a6ec0a/
     powerpc |                  sudo-1.8.10p3 | NOK | http://autobuild.buildroot.net/results/fef78793b753cc0cc3af08c601d773e701b4e5bd/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/5796f212f60d8d31107ccdd9cd889362f7315bf7/
         arm |                tinyxml-2.6.2_2 | TIM | http://autobuild.buildroot.net/results/45887b06d39dc7eeebf866ffb3ee682bba70bbfe/
     powerpc |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/63290cecd1c3c4c30db56a59321ce7a9daeefc4a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c30ba63acaf09f91afc8808a190dfd5f71551028/


-- 
http://autobuild.buildroot.net
