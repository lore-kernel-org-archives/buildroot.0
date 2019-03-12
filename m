From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Mar 2019 09:25:08 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-10
In-Reply-To: <20190311125037.GA20362@lwo1-lhp-f71841> (Vadym Kochan's message
 of "Mon, 11 Mar 2019 14:50:37 +0200")
References: <20190311070050.A164586F58@hemlock.osuosl.org>
 <20190311125037.GA20362@lwo1-lhp-f71841>
Message-ID: <87sgvsfqjf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadym" == Vadym Kochan <vadim4j@gmail.com> writes:

 > Hi All,
 > On Mon, Mar 11, 2019 at 07:00:44AM -0000, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> Build statistics for 2019-03-10
 >> ===============================
 >> 
 >> branch |  OK | NOK | TIM | TOT |
 >> 2018.02.x |  23 |   1 |   0 |  24 |
 >> 2018.11.x |  26 |   1 |   0 |  27 |
 >> master | 236 |  73 |   3 | 312 |
 >> 
 >> Results for branch '2018.02.x'
 >> ==============================
 >> 
 >> Classification of failures by reason
 >> ------------------------------------
 >> 
 >> host-libunistring-0.9.7 | 1 
 > Regarding this, I found that the issue should be fixed in 0.9.10 version:

 > 	https://www.mail-archive.com/bug-libunistring at gnu.org/msg00310.html

 > which is already latest in 2018.11.x and master branches, but not in 2018.02.x

Thanks, I have cherry picked the bump to 0.9.10 on the 2018.02.x branch.

-- 
Bye, Peter Korsgaard
