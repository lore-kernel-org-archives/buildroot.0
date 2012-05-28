From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 May 2012 20:08:04 +0200
Subject: [Buildroot] [PATCH resend] Bump gpsd from version 2.95 to
	version 3.5
In-Reply-To: <4FC33624.3000208@imgtec.com> (Markos Chandras's message of "Mon, 
 28 May 2012 09:24:04 +0100")
References: <1338047171-4119-1-git-send-email-spdawson@gmail.com>
 <4FC33624.3000208@imgtec.com>
Message-ID: <87zk8s6uwr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:

 Markos> On 05/26/2012 04:46 PM, spdawson at gmail.com wrote:
 >> From: Simon Dawson <spdawson@gmail.com>
 >> 
 >> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 >> ---
 >> package/gpsd/Config.in                         |   17 +--
 >> package/gpsd/gpsd-3.5-fix-compile-errors.patch |   14 +++
 >> package/gpsd/gpsd-fix-libgpsmm.patch           |   23 ----
 >> package/gpsd/gpsd-navcom.patch                 |   47 -------
 >> package/gpsd/gpsd.mk                           |  156 +++++++++++++-----------
 >> 5 files changed, 107 insertions(+), 150 deletions(-)
 >> create mode 100644 package/gpsd/gpsd-3.5-fix-compile-errors.patch
 >> delete mode 100644 package/gpsd/gpsd-fix-libgpsmm.patch
 >> delete mode 100644 package/gpsd/gpsd-navcom.patch
 >> 


 Markos> Hi Simon,

 Markos> I believe you need to remove the version string from the
 Markos> "gpsd-3.5-fix-compile-errors.patch". See

 Markos> http://lists.busybox.net/pipermail/buildroot/2012-May/053739.html

Indeed. And as 3.6 has recently been released, it makes more sense to
use that instead.

-- 
Bye, Peter Korsgaard
