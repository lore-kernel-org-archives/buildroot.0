From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:21:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcpdump: fix build without
 pod2man
In-Reply-To: <20200914204239.3456222-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 14 Sep 2020 22:42:39 +0200")
References: <20200914204239.3456222-1-fontaine.fabrice@gmail.com>
Message-ID: <877dsdzjfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use dhcpdump target to avoid building dhcpdump.8 as it will raise the
 > following build failure if pod2man is not available:

 > pod2man --section 8 \
 > 	--date "23 June 2008" \
 > 	--name "DHCPDUMP" \
 > 	--center "User Contributed Software" \
 > 	dhcpdump.pod dhcpdump.8
 > /bin/sh: pod2man: command not found
 > make[1]: *** [Makefile:11: dhcpdump.8] Error 127

 > Fixes:
 >  - http://autobuild.buildroot.org/results/db3be149ec71de8376f685a6a9f027191d9bccc9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
