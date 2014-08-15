From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 10:14:39 +0200
Subject: [Buildroot] [PATCH] ltrace: disable on mips/mipsel
In-Reply-To: <1408038104-9440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 14 Aug 2014 19:41:44 +0200")
References: <1408038104-9440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iolu41ao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > ltrace currently doesn't build on mips/mipsel, and it's an upstream
 > issue that has been reported. Until it get fixed, let's disable ltrace
 > for mips/mipsel.

 > Fixes:

 >   http://autobuild.buildroot.org/results/43a/43a8fc7075f52eab74ebfee4c9f25dd2b886e75e/

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
