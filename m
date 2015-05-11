From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 May 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-10
Message-ID: <20150511063014.873E6100FEC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-10
===============================

        success : 279
       failures : 18 
       timeouts : 0  
          TOTAL : 297

Classification of failures by reason
====================================

                ipmiutil-2.9.5 | 2 
                  boost-1.57.0 | 2 
               host-mono-4.0.1 | 2 
         lua-periphery-1.0.4-1 | 2 
                  snmppp-3.3.4 | 2 
          google-breakpad-1373 | 2 
                 rsyslog-8.9.0 | 2 
               libsigsegv-2.10 | 1 
      host-gdb-arc-2014.12-gdb | 1 
              wireshark-1.12.4 | 1 
                      qt-4.8.6 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/622281ef002aaeb97b1af24491533ba396e68bcf/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/13e5b5c9769f33c0fd95137d333d72ce2f22cb8f/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/1d08eceffcf9dd7434002124523665f693c60710/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/6e5bbb0be8acdeffa6f03010552969bc87df966f/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/aeb2c1e8ef895c1963eff5fbba3fc9b2e12b70cf/
         arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/1d554744b89fd87d5e89022cd581155b9714e03b/
      x86_64 |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/258710135064bb8d24199ff4d807ad31a6fe44dc/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/b63502fe7acd6fec7cdc7b6b76f3cce118c3a3c9/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/a99faf769dda63231771dc78243fc92d3e33824b/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/793e1774a5922db4424619aa5a397ec3d3d497b4/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/53c57c4d1658ec36cce1b64205af77bba34a1d07/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/33cc66d9ee0db250722bbe269e751757ac64dc3f/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/44dd185384e827ad86e5e2cddfb9f9189b98e275/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/2b9d3edc8341675455bc3b74d1e84c8c0c24c521/
      x86_64 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/2a80357237ed7225823a008b5ff02bab01269814/
    mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/3b05d89d56b99de7d12066b6861715ffd959dff2/
    mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c4f131208d0ce91f72c6630135c50747e2026ec1/
      xtensa |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/7762b48e30f6c2dcdd58a88f95551330223c4f70/


-- 
http://autobuild.buildroot.net
