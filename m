From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:19:22 +0200
Subject: [Buildroot] [PATCH] boost: force the target ABI for ARM
	architecture
In-Reply-To: <1410024962-30877-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 19:36:02 +0200")
References: <1410024962-30877-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppf8mrhx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Just like was done in commit b37641c95be79fcb76cbc7042c4cf21a2c64d0f6
 > ("boost: Force the target ABI for MIPS architecture") by Vicente for
 > the MIPS architecture, this commit also forces the ABI passed to Boost
 > build system to "aapcs" for the ARM architecture.

 > Since we now have three cases to handle, an intermediate variable
 > called BOOST_ABI is introduced.

 > Fixes:

 >   http://autobuild.buildroot.org/results/5ae/5aeb3a9f067faf6687051643bf49a0b619cb4c3b/

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
