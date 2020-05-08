From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 12:08:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/gflags: force Release mode
In-Reply-To: <20200425162244.1289359-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 25 Apr 2020 18:22:44 +0200")
References: <20200425162244.1289359-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2q2pwm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Force Release otherwise libraries will be suffixed by _debug which will raise
 > unexpected build failures with packages that use gflags (e.g. rocksdb)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3545774258babc3584f69e7d523efdf7fff1acb5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
