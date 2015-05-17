From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 23:05:21 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-plugins-bad: remove obsolete make
	rules
In-Reply-To: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
 (=?utf-8?Q?=22Beno=C3=AEt=09Th=C3=A9baudeau=22's?= message of "Thu, 7 May
 2015 16:58:19 +0200")
References: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
Message-ID: <87oali7w4u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:

 > Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
 > version" (from 1.2.4 to 1.4.1) removed the configuration options for the
 > cdaudio and eglglessink plugins as a consequence of their removal in
 > 1.3.1. However, that commit did not remove the corresponding make rules,
 > so remove them now.

> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
