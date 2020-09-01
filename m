From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 09:19:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/graphite2: fix static install
In-Reply-To: <20200831192215.1677034-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 31 Aug 2020 21:22:15 +0200")
References: <20200831192215.1677034-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1rm9d7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't install an incorrect libtool file when building a static library
 > to fix the following build failure with harfbuzz:

 > arm-linux-g++.br_real: error:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgraphite2.so:
 > No such file or directory
 > make[5]: *** [main] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9ebe1d11e80755d59190ef2aae82bbba5cc45e44

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
