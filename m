From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Oct 2013 08:08:43 +0200
Subject: [Buildroot] [git commit] Makefile: export BUILD_DIR
In-Reply-To: <OF5F29E93C.F28E759E-ON86257C0E.0062B22A-86257C0E.00637BA8@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 24 Oct 2013 13:06:43 -0500")
References: <20131024064830.61FC19BB90@busybox.osuosl.org>
 <OF5F29E93C.F28E759E-ON86257C0E.0062B22A-86257C0E.00637BA8@rockwellcollins.com>
Message-ID: <8738np991w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 > Peter,
 > Can we please revert this change? It is causing issues with building 
 > u-boot
 > as seen by the autobuilder logs:

 > http://autobuild.buildroot.net/results/1f6/1f65289d5c284caa82a4e9137613f792797ee08a/build-end.log
 > http://autobuild.buildroot.net/results/6a5/6a5f77483e908dc96d08824cf9113402431bace7/build-end.log

 > Exporting BUILD_DIR is dangerous for u-boot as shown by the following 
 > excerpt
 > from the uboot/Makefile:

Yes, I just noticed as well. Will revert.

-- 
Bye, Peter Korsgaard
