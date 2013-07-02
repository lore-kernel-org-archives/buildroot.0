From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 13:46:36 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add missing depends on
	C++ for the OpenCV plugin
In-Reply-To: <1372714474-11674-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 1 Jul 2013 23:34:34 +0200")
References: <1372714474-11674-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gh9tc9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> OpenCV requires C++ support, so we shouldn't select it without
 Thomas> depending on C++ support.

 Thomas> Fixes:
 Thomas> http://autobuild.buildroot.org/results/71f/71f2d8a267a0d159521407a9a2330e68d756c4b3/build-end.log.

Committed, thanks.

-- 
Bye, Peter Korsgaard
