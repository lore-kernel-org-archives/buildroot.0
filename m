From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 16:47:39 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
	openjpeg 2.2
In-Reply-To: <20170908133156.10357-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 8 Sep 2017 15:31:56 +0200")
References: <20170908133156.10357-1-ps.report@gmx.net>
Message-ID: <87mv5kkvas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch to fix build against openjpeg 2.2.
 > Fixes [1]:

 >   gstopenjpeg.h:42:37: fatal error: openjpeg-2.1/openjpeg.h: No such file or directory

 > [1] http://autobuild.buildroot.net/results/90f1f7838f08e3a557be27470406d4d84dbcc828

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v2 -> v3:
 >   - add _GETTEXTIZE (instead of Makefile.in.in patch, suggested by Thomas Petazzoni)

 > Changes v1 ->v2:
 >  - add _AUTORECONF (suggested by Peter Korsgaard)

Committed to 2017.02.x after dropping the meson changes, thanks.

-- 
Bye, Peter Korsgaard
