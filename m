From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Sep 2017 21:22:55 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: fix build against
	openjpeg 2.2
In-Reply-To: <20170907151757.28606-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 7 Sep 2017 17:17:57 +0200")
References: <20170907151757.28606-1-ps.report@gmx.net>
Message-ID: <87k21ab9f4.fsf@dell.be.48ers.dk>
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
 >  ...1-openjpeg-Fix-build-against-openjpeg-2.2.patch | 93 ++++++++++++++++++++++
 >  1 file changed, 93 insertions(+)
 >  create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Fix-build-against-openjpeg-2.2.patch

Hmm, how does this work? We don't have GST1_PLUGINS_BAD_AUTORECONF = YES
but the patch changes configure.ac.

-- 
Bye, Peter Korsgaard
