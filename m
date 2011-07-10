From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 20:15:34 +0200
Subject: [Buildroot] [PATCH] libarchive: bump to version 2.8.4
In-Reply-To: <0c0acd2751642f682c33db5ea13d96c8ce3993ac.1310304596.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 10 Jul 2011 16:30:33 +0300")
References: <0c0acd2751642f682c33db5ea13d96c8ce3993ac.1310304596.git.baruch@tkos.co.il>
Message-ID: <87r55yxard.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> The libxml2 dependency is new in this version, and does not behave nicely with
 Baruch> cross compile. The configure script looks for the host xml2-config. Add
 Baruch> '--disable-xml2' as a workaround for now.

Thanks, committed.

From a quick look, it seems like the configure script respects
XML2_CONFIG, so I added a followup commit to add optional libxml2
support.

-- 
Bye, Peter Korsgaard
