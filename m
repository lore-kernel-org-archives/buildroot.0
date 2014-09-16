From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2014 21:08:31 +0200
Subject: [Buildroot] [PATCH] qt5: bump to 5.3.2
In-Reply-To: <1410872298-13415-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Tue, 16 Sep 2014 15:58:18 +0300")
References: <1410872298-13415-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87a95z9yds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > Only use ccache prefix in QMAKE_CC and QMAKE_CXX since the build system is
 > broken when QMAKE_AR contains a space character.

 > Remove the upstreamed uClibc patch.

 > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
