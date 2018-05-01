From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:53:25 +0200
Subject: [Buildroot] [PATCH] package/wmctrl: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20180417182208.8404-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 17 Apr 2018 20:22:08 +0200")
References: <20180417182208.8404-1-romain.naour@gmail.com>
Message-ID: <876047ooii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > set x-includes and x-libraries configure option for cross-compiling.
 > wmctrl can use poisoned paths if these options are not passed to
 > configure script.

 > Fixes:
 > http://autobuild.buildroot.net/results/7e5/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: J?r?me Pouiller <jezz@sysmic.org>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
