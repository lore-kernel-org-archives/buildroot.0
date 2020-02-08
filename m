From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 20:47:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: fix powerpc altivec
 build failure
In-Reply-To: <20200208103900.3572-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 8 Feb 2020 11:39:00 +0100")
References: <20200208103900.3572-1-giulio.benetti@benettiengineering.com>
 <20200208103900.3572-2-giulio.benetti@benettiengineering.com>
Message-ID: <87blq8uair.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > NSS_DISABLE_ALTIVEC variable has been introduced into libnss so let's
 > use it to prevent Altivec build failure on PowerPc by passing
 > NSS_DISABLE_ALTIVEC=1 if BR2_POWERPC_CPU_HAS_ALTIVEC is not 'y'.

 > Fixes:
 > http://autobuild.buildroot.net/results/957/957cec911bcd68a18418ad02f13e7e3001521c59/
 > http://autobuild.buildroot.net/results/6a1/6a1578619a477e1605fe152070f004b662f1d839/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
