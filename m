From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Dec 2012 17:43:53 +0100
Subject: [Buildroot] [PATCH 2/4] gstreamer: port to gstreamer-1.0
In-Reply-To: <1565829996.1426028.1355934869325.JavaMail.root@advansee.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Wed, 19 Dec
 2012 17:34:29 +0100 (CET)")
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
 <1355936324-9585-2-git-send-email-bogdan@nimblex.org>
 <1565829996.1426028.1355934869325.JavaMail.root@advansee.com>
Message-ID: <87txri2drq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:

 Beno?t> Dear Bogdan Radulescu,
 Beno?t> On Wednesday, December 19, 2012 5:58:42 PM, Bogdan Radulescu wrote:
 >> From: Bogdan Radulescu <bogdan@nimblex.net>
 >> 
 >> Initial commit of updated gstreamer + plugins which compile
 >> 
 >> Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>

 Beno?t> Some environments are not yet gst-1.0-ready, especially for
 Beno?t> network streaming.  Wouldn't it be useful, at least for some
 Beno?t> time, to have the choice between 0.10, 1.0, or both (they can
 Beno?t> be installed side by side without any conflict)?

Indeed. Either as a version selection in gstreamer (like E.G. busybox)
or as a seperate BR2_PACKAGE_GSTREAMER_10 if the differences are too
big.

-- 
Bye, Peter Korsgaard
