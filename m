From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Nov 2014 23:04:47 +0100
Subject: [Buildroot] [PATCH] webkit: Add --enable-dependency-tracking to
	the configure options
In-Reply-To: <1415297036-21850-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 6 Nov 2014 18:03:56 +0000")
References: <1415297036-21850-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <878ujoyohs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > --disable-dependency-tracking was added globally to
 > package/pkg-autotools.mk by this commit:

 > http://git.buildroot.net/buildroot/commit/?id=3e37b0fc6cbbe2245e39fedb247a381fb4e0d992

 > This causes a failure in webkit because some source files are generated
 > after the Makefile is created. To fix this, we add
 > --enable-dependency-tracking to the configure options.

 > Fixes:
 >   http://autobuild.buildroot.net/results/5beea967b02df202bca1d42afd6fa8c2c13383d5/

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
